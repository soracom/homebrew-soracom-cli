class SoracomCli < Formula
  VERSION = "0.5.7"
  SHA256_MAC_32 = "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  SHA256_MAC_64 = "2075684b8865a8a519a8bb611f2596a7cf7de73fc4e4f7a77d4305cf3e1de239"
  SHA256_LINUX_32 = "66cf1efca4c254c941fcbd47d8d77b9977e9de1ce10f46d3706725f488286446"
  SHA256_LINUX_64 = "215ce34e7b0cb5194b40b7e69b1459dda41f3a5842b7a65caab015eb2e35c79f"

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
