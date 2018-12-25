class SoracomCli < Formula
  VERSION = "0.4.0"
  SHA256_64 = "b92e96684bcb345f0f5bac88d3598676ff7d261281cebc3d4b4811cbcbb5cd5a"
  SHA256_32 = "f0e4f199f70766a4786c1b6447267ae215c9500f1a4215f0398265c803d50bda"

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
