class SoracomCli < Formula
  VERSION = "0.12.0"
  SHA256_MAC_amd64 = "9da8bbe734ac642c3e1d913f2ce4a57ad97b4011c41413ea508e6e7cee9163a3"
  SHA256_MAC_arm64 = "86fba2a7e9389d2cabbfb49657696ef1f1b5c3a2dde95ea88954e7d6556ce9db"
  SHA256_LINUX_amd64 = "f8b877dc1762d6f077bb4c44c2c23238862072a77904f73f97c527fa41c5cef7"
  SHA256_LINUX_arm64 = "6642cee9fd12945172a86ccbe9fdd808701da2cb844b1c5ed5d44cdfab907dbd"
  SHA256_LINUX_386 = "f807f43846f967a2fc3dbe60931a342d92ba4ed70afbf2d2b9612e1197e74082"
  SHA256_LINUX_arm = "13b9d1896528c6e1ee701238875df4ba3271ee58068531aabdd24389336b39c7"

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
