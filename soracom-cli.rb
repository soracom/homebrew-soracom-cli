class SoracomCli < Formula
  VERSION = "0.3.4"
  SHA256_64 = "296462e936cb0ec9853c1b38725713c692dffbbcd4270704a50c45e2b8f67e20"
  SHA256_32 = "6876c783ffb71c9edae596dce878e42d913241b0f2123865be53d8e9576f73ec"

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
