class SoracomCli < Formula
  VERSION = "0.2.2"
  SHA256_64 = "647432e15b8247b868be27ebdcbc57be38c9e676049adc0be3e06ee8085bdfb4"
  SHA256_32 = "f93c5a749a9f2e50a1128b7921156fbdb41c1ffc78e0de6e574fb9438929783c"

  desc "A command line tool to invoke SORACOM API"
  homepage "https://github.com/soracom/soracom-cli"
  version VERSION

  if Hardware::CPU.is_64_bit?
    @@binname = "soracom_#{VERSION}_darwin_amd64"
    url "https://github.com/soracom/soracom-cli/releases/download/v#{VERSION}/#{@@binname}"
    sha256 SHA256_64
  else
    @@binname = "soracom_#{VERSION}_darwin_386"
    url "https://github.com/soracom/soracom-cli/releases/download/v#{VERSION}/#{@@binname}"
    sha256 SHA256_32
  end

  def install
    mv @@binname, 'soracom'
    bin.install 'soracom'
  end

  test do
    system "false"
  end
end
