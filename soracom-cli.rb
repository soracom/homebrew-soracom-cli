class SoracomCli < Formula
  VERSION = "0.3.0"
  SHA256_64 = "a7508a79873faa0e4fc2488c09705b520f74ac9437c4c5c2114e49c24a37f2f5"
  SHA256_32 = "8dd8b228a697a9c5116caa86465b86fdda170c225009313491c30b848fc81581"

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
