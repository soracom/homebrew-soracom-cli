class SoracomCli < Formula
  VERSION = "0.2.1"
  SHA256_64 = "294f7fef9d26dc6e12d2abf518ee60817a169ad2c54e88d18bc28eabed2fb8b0"
  SHA256_32 = "6d2f25d1fa8fd90cc13babd1a061943c2ff7c13bef04b5e3835693f417830391"

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
