class SoracomCli < Formula
  VERSION = "0.10.3"
  SHA256_MAC_amd64 = "b17c609f4c765f86af57b97108279b5252bc05e75b53983610f3d43e29d32034"
  SHA256_MAC_arm64 = "2bc55b90d92351fd3247db8e7fc554e5e12a4762569fbc7224da3dbca03aa107"
  SHA256_LINUX_amd64 = "f5b56f518f18b727e7eab6579b4d2dc0b268c8833493c3d60d806e1ad3971a10"
  SHA256_LINUX_arm64 = "30ef0ee078a52d8ea49bd84949c98b5b70e557f324c3c6745d4417b736e8d8b6"
  SHA256_LINUX_386 = "675655b98c0c0898de8b737bf034276e9c5932672a995d76a40b7fe0c778bf62"
  SHA256_LINUX_arm = "2625d5908dc4ab50716b079d54db5a79b22150cc53f5c0426d4da90eee1e5195"

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
