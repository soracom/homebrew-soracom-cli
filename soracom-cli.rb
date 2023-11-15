class SoracomCli < Formula
  VERSION = "1.2.0"
  SHA256_MAC_amd64 = "9b34d67719fcb176981bdea411597fe51017db268d0b856e70d50f48d0935adf"
  SHA256_MAC_arm64 = "bcdfcafd31c5b0a99e3d17ed7595014d6e2565bf6a02ed237d6f3b40044ab268"
  SHA256_LINUX_amd64 = "897acc654bcbccb3c077a5815a60dbf9a0bc38af8decbcf6ddf022968b39b684"
  SHA256_LINUX_arm64 = "ec5e3b98f6bd4d4b4ddb38452e7b2156bf68cd9f446cc69b14e5558e49e29b75"
  SHA256_LINUX_386 = "0d689e6d5569690f62b2e24c713c2e16c7b67cad39f06cdcba30ff252afa2378"
  SHA256_LINUX_arm = "34d97f6c68042d3c39e5a484dc58beb0ba671c799f82c58bbd8487734d5addbb"

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
  license "MIT"

  def install
    mv @@binname, 'soracom'
    bin.install 'soracom'
  end

  test do
    system "false"
  end
end
