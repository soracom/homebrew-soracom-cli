class SoracomCli < Formula
  VERSION = "0.3.8"
  SHA256_64 = "8534bf0e95367f02fa9534449adfe7852f1893564052491d5ce5e89a2a25ad66"
  SHA256_32 = "4fbfa13f3a06ac77f72246b00ffdc8be5a0e3935cd533d5d43f18bfc6caddbf2"

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
