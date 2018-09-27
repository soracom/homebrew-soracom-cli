class SoracomCli < Formula
  VERSION = "0.3.6"
  SHA256_64 = "b47f34ab8fac83ce0e4fe6530ae60126a10638374cc7ef004c3c26043511fe72"
  SHA256_32 = "75b95bb4021fce562a0ad9d2d81d9ec3b9d2cd38b45808243ea62c9957870c73"

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
