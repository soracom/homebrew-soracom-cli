class SoracomCli < Formula
  VERSION = "0.6.2"
  SHA256_MAC_32 = "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  SHA256_MAC_64 = "ec1d91d333bf4aec20c0ae853df0a8043d85bb7c4172af382d7c60b7d3e06a14"
  SHA256_LINUX_32 = "2dbeec3d98c277c6108ed6e3967712721ea69311e700ee21b71f8b1b80d027d7"
  SHA256_LINUX_64 = "a51d0570a3313ac4cc28553be546600ea4fdd9c76198b160e09fd4270722f693"

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
