class SoracomCli < Formula
  VERSION = "0.10.2"
  SHA256_MAC_amd64 = "a7ad50dffcd4be2d9d081a67115fc928e708e911f510638e00752c2117425c40"
  SHA256_MAC_arm64 = "d31d0a7a11efe6ad32cda202c078f41e870e4db16fa7aeaba7adb36612c06e6d"
  SHA256_LINUX_amd64 = "50b48a03b647ad98ae34e2bcca216aaf4086f90093cd385c5a1dfb901dcd0faf"
  SHA256_LINUX_arm64 = "9030c6d1b391468b37d1f446cc7c862fb2c38d4051cd3ddcd5ca3955d4a4dd8e"
  SHA256_LINUX_386 = "8c7b55694f0efb8b94144e5cd4916ebe6d6d2406a8f394777757a6ca218509db"
  SHA256_LINUX_arm = "839e8137743cbf6c38f969c71169dc0ec5c6ae8c49af220ca9eb384f85528cf6"

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
