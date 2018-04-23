class SoracomCli < Formula
  VERSION = "0.2.9"
  SHA256_64 = "394593039575a3b8efc2c97aca248e8cc7cb10d5457c5054f2686d5187c27396"
  SHA256_32 = "290146eae9b534b65d608c14ac16f34b1e1bf1d9ddeb1b4df8d42c021ba1aeb5"

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
