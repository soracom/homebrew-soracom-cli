class SoracomCli < Formula
  VERSION = "0.2.8"
  SHA256_64 = "ea8e8bbdca619de23b32678a9e7901b3819352123d77c7d1d9c1c6fc4a8f2ac4"
  SHA256_32 = "1858d579f4db744c3d06ee20af71992447707df916da35490a6383b229fc9579"

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
