class SoracomCli < Formula
  VERSION = "0.3.3"
  SHA256_64 = "ee93912e264baee28326d45d5d08c5b7144402c1b45836a2c2e71cdd343d568f"
  SHA256_32 = "90b579dde7f8cc365ba50606bc94b2a6d0cd7fdd23de49db2d676266a8bb8acd"

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
