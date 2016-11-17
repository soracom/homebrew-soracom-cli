class SoracomCli < Formula
  VERSION = "0.1.5"
  SHA256_64 = "e567e826cfe825a9b84614cc16b59ad7ad05342ca556c2ea7c94df88d9f1d670"
  SHA256_32 = "b5cb1ad680c1c6e28b2a7360d7fd4fbc7012354f800525e71e92022fa0446f98"

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
