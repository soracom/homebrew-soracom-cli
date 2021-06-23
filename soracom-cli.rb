class SoracomCli < Formula
  VERSION = "0.10.0"
  SHA256_MAC_amd64 = "a6714551e65c9ed21a791a9b0a04a35011e9426e4efe67df8bfc64406a804d1a"
  SHA256_MAC_arm64 = "896ef6be48cfaa15515c510a66816a59d5a47beab7cef439c8cb5e75401b4290"
  SHA256_LINUX_amd64 = "ad91f62baa981aed66d7f8f831d52877c04e33e48a10c9ac78191eee895a2639"
  SHA256_LINUX_arm64 = "dde32512d493cce7b5f79ee1800a1585277677a14306a4f775d5ddc94d5c4f30"
  SHA256_LINUX_386 = "2a54242a62c567c9ddec53998a58457c38dba7c85de10c0ffc91f6bd585a3a38"
  SHA256_LINUX_arm = "34fb3c84e03e771363e41d93d7879447b01431b1ba7d4bd20328b88bb7117086"

  SHA256 = {
    'darwin' => {
      'amd64' => SHA256_MAC_amd64,
      'arm64' => SHA256_MAC_arm64,
    },
    'linux' => {
      'amd64' => SHA256_LINUX_amd64,
      'arm64' => SHA256_LINUX_arm64,
      '386'   => SHA256_LINUX_386,
      'arm'   => SHA256_LINUX_arm,
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

  case `uname -m`.chomp!
  when 'x86_64'
    arch = 'amd64'
  when 'arm64', 'aarch64'
    arch = 'arm64'
  when 'i686'
    arch = '386'
  when 'armv6l', 'armv7l'
    arch = 'arm'
  else
    puts "unknown arch: #{`uname -m`}"
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
