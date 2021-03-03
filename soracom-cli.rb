class SoracomCli < Formula
  VERSION = "0.7.0"
  SHA256_MAC_32 = "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  SHA256_MAC_64 = "355f20ed85cb8db70dfd189a124a3272080ecaf691ca94f8e182e496febd7f6a"
  SHA256_LINUX_32 = "9c50b3a4c1137dfdbb8e0255ec8974df7613f17acac7a777dda6483ae6d3f92f"
  SHA256_LINUX_64 = "c0aa842714130d216306bcff4c82760082bf31b0b74790f96db04625d76d63f9"

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
