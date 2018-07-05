class SoracomCli < Formula
  VERSION = "0.3.2"
  SHA256_64 = "6c83b6c95f72bf33a4ebc68bdcc04c7b985ec043ae5d51d2824e2c355555da3b"
  SHA256_32 = "ea30c38b2a6a09e81bd3925944dbd4ad6537a85097e456629d7c141a6425c593"

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
