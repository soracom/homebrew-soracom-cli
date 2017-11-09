class SoracomCli < Formula
  VERSION = "0.2.6"
  SHA256_64 = "1c7a40f8c87c2769293b14e3c4a74ed4c389487a82682c7abd241ca1e3c6a7b4"
  SHA256_32 = "89a8954b3097eb0351443e29c2badad069aca7d024d6f004de971837d19eebb8"

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
