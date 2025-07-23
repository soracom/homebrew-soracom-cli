class SoracomCli < Formula
  VERSION = "1.5.0"
  SHA256_MAC_amd64 = "919f6003e84b34c7e2d0647ffff473b797736a84b060e4a3095c2ff3bcc84149"
  SHA256_MAC_arm64 = "b69987693c469dcbc51814e6a2a6d4d05183ed37b3659871d11cd141b7c85009"
  SHA256_LINUX_amd64 = "4c75d5413361c6f583b61522b6fb632e15b9579fd8fe1cfa11f89e19e1b845f7"
  SHA256_LINUX_arm64 = "2b4181ae6f614bfdbc3d519fc68f6cdc6852b3b98196fd6c98dd40310ef5a822"
  SHA256_LINUX_386 = "33644c987bf6f5eb859f7145684e4e99b3962a042fbc59554142cce680f40bf0"
  SHA256_LINUX_arm = "6ce112d2d8aa0aab504e397c8145286722dbd8031a4484055627fdeeecb3b9c7"

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
