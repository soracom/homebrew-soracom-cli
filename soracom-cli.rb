class SoracomCli < Formula
  VERSION = "0.2.5"
  SHA256_64 = "f63a49eec105ec4fd1505de17a47e68206d1eb48b722132fa0cafd433dd2367e"
  SHA256_32 = "3986008dec344f1f47650a462cbb52ea1b7e395a7ea840248b06c7156134251e"

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
