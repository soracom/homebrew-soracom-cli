class SoracomCli < Formula
  VERSION = "0.2.7"
  SHA256_64 = "8f1582b43214371c78d842e35a276e712e1336383c688a8e9a9b8d0fea27f86e"
  SHA256_32 = "e5110a052fa9dad764afe48106f50a73e7d8e1a48bee7424d4755c2f8b690c97"

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
