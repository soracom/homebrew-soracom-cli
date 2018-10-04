class SoracomCli < Formula
  VERSION = "0.3.7"
  SHA256_64 = "c778e23ff9429b17d42270e6e2c89aa0bbb02f851bae6d1c35e143ff3d4380e7"
  SHA256_32 = "0ad309790227f55542e738e51daf14ebac87244816e26ecab566018784148458"

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
