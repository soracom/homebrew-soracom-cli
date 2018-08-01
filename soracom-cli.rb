class SoracomCli < Formula
  VERSION = "0.3.5"
  SHA256_64 = "05a4a90977ef72c6d9a745d99380177f5bac5d788ed65259a4c57f66775031de"
  SHA256_32 = "596fdba2e0a10ec88624d2339a783ee354e606f6f0e65a921048ab8bcd61f648"

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
