class SoracomCli < Formula
  VERSION = "0.2.4"
  SHA256_64 = "518f699debf7dd109aaa15683dbb4320b3bb002f5468ee51a1dc477ff7302ded"
  SHA256_32 = "7ee077fe20db6a80b906af1c588711e7a9a56643491b0540949ab68dfb5a33d5"

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
