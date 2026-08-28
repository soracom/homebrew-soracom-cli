class SoracomCli < Formula
  VERSION = "1.8.0"
  SHA256_MAC_amd64 = "4d16684785a4c152e0db7b7d9b80dcddde4f54b3c1ba1fe7a8bd8ccb3978788d"
  SHA256_MAC_arm64 = "9e587b2cc64aaca7f0b3b61d255b15d93c96de7fd527c8c661bb703007f69661"
  SHA256_LINUX_amd64 = "75e4ee759f1b329c487e40107ea6810631d25ba02e1c21f0bd45378661ceec33"
  SHA256_LINUX_arm64 = "a3f082e5b791b1aff096cab580e744eea6f37732349648709cda91f204d9199a"
  SHA256_LINUX_386 = "b3367fe05c5d8b10d9055d629d2222e8bd13bc76b4a915c2d52caf441d129cd0"
  SHA256_LINUX_arm = "59bc7302da8ec0f1939d56ff8fc341c348a653011da2ec1558fc78be214603de"

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
