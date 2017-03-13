class SoracomCli < Formula
  VERSION = "0.1.9"
  SHA256_64 = "0afad9f5cc450d36252c1442989e495a94248792d1cb629ff9c195d1cfebd775"
  SHA256_32 = "edf72ade8358a705b1c737f609d851cc26f9fc8d09b91fbda46829f027b5b987"

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
