class SoracomCli < Formula
  VERSION = "0.2.0"
  SHA256_64 = "88b1446eb8f43b863efdb0bd57a1e0db9e3685f76bb71faa2a867979dd70d5ae"
  SHA256_32 = "4efb6061f62fbae79e515b1baffbf25437d2526b3745f76e0147eeec7f387066"

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
