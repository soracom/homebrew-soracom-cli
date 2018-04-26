class SoracomCli < Formula
  VERSION = "0.3.1"
  SHA256_64 = "5102a380f74cc01e658938254b0b1daa6e7d46798d77f472c165838816681bb1"
  SHA256_32 = "aee637cb41f816ae76772c6a13b93c7184bb443c84e6a0787d2013a75494bcc6"

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
