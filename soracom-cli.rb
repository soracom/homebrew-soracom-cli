class SoracomCli < Formula
  VERSION = "0.3.9"
  SHA256_64 = "4bae5b48feaed90786dd91984e52234865befb653de8bd39d4a8562ad3fae3c7"
  SHA256_32 = "f7b8d3268111f525a29e3ca198c226428ad5b1e36f22e6db39e9eccd5278fd8a"

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
