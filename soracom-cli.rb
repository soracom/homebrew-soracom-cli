class SoracomCli < Formula
  VERSION = "0.4.4"
  SHA256_MAC_32 = "cf5047df5c21baac0af8b304cbb76849905399c93c7fb05fa315f91db089c492"
  SHA256_MAC_64 = "5d3b62ae8173c63aa3b5946c007035fa9d648659b046a14af0a0c66bb8202ee9"
  SHA256_LINUX_32 = "79c4075d041a73fa364ffd8371ff040aee74d5b39e1aea02c531ec9925a8aafa"
  SHA256_LINUX_64 = "d60139e328d5065f47e6619bad9ab68368c7739e58540e757734e2bedaa3f6dd"

  SHA256 = {
    'darwin' => {
      'amd64' => SHA256_MAC_64,
      '386'   => SHA256_MAC_32,
    },
    'linux' => {
      'amd64' => SHA256_LINUX_64,
      '386'   => SHA256_LINUX_32,
    },
  }

  desc "A command line tool to invoke SORACOM API"
  homepage "https://github.com/soracom/soracom-cli"
  version VERSION

  if OS.mac?
    os = 'darwin'
  else
    os = 'linux'
  end

  if Hardware::CPU.is_64_bit?
    arch = 'amd64'
  else
    arch = '386'
  end

  @@binname = "soracom_#{VERSION}_#{os}_#{arch}"
  url "https://github.com/soracom/soracom-cli/releases/download/v#{VERSION}/#{@@binname}"
  sha256 SHA256[os][arch]

  def install
    mv @@binname, 'soracom'
    bin.install 'soracom'
  end

  test do
    system "false"
  end
end
