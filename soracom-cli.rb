class SoracomCli < Formula
  VERSION = "0.5.3"
  SHA256_MAC_32 = "58976d88f89fc5c740de7a9ae8f9c72f6d11654d40b1e0e7d728a833328c4a78"
  SHA256_MAC_64 = "d21ef0aa8097c8c36b9e39a69b76e4e541955c9ed20cfb3d4510bfc5861c980a"
  SHA256_LINUX_32 = "4e40475eb1b85bcb49ee25d4edb0f79175086d7d154b93beb0063e49b195750d"
  SHA256_LINUX_64 = "e56a89d1a762c0cbcc6d583c6f6cec1e6560e65367bedfee18b457f8a5ec203e"

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
