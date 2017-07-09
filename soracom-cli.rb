class SoracomCli < Formula
  VERSION = "0.2.3"
  SHA256_64 = "e85e688e9e6a78ba09089dc16e2d79a90f93d7ed7b46e810f0b7736823bf1c1e"
  SHA256_32 = "bb990e9da79f36c21c7c69ad5bd35aaa5c8c22a0703e9e1b459314abbc4e085d"

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
