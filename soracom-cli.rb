class SoracomCli < Formula
  VERSION = "0.1.7"
  SHA256_64 = "e7eba9a93884e0aa1619eb028060f3b081f9e528a265d892fe85e845e7b7bf58"
  SHA256_32 = "cc6dfe04612ea76d7bda13c60c74ecef5e30113b821b5d7aab1a42156c1d4540"

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
