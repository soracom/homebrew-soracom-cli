class SoracomCli < Formula
  VERSION = "0.1.8"
  SHA256_64 = "415da67b0652bf9977cb6aa120bebafc7e48a34f29e874e0978e5533a4d29d26"
  SHA256_32 = "dadeadde1194c9e1c0d0c43205897560d39ab88917347799732c9cd3cf4a60aa"

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
