class SoracomCli < Formula
  VERSION = "1.0.0"
  SHA256_MAC_amd64 = "6fec6ba780d87d5f6bd926bae28add82a0bf3b31fd23c8dbf5ea3fa40a062740"
  SHA256_MAC_arm64 = "2581fdaf0e66ba79b80ed827df7948e701b8eee1a060259c4cbc4813e2ac7b1a"
  SHA256_LINUX_amd64 = "c2840aa43f4e930a22cfcddab70533b1cace00380aa7d9ac45f26d79ae4ed5f0"
  SHA256_LINUX_arm64 = "d5a2942552c6036f192278e1087ec50894ef1437450a47585d0ea1dd5fbf79e0"
  SHA256_LINUX_386 = "1650cbe6641a86c2c9195230e56ea5703190556ff78012f1916f8fb01c7f446e"
  SHA256_LINUX_arm = "43adc178b34fcb540e3e607ac35a09b226dd0b2f16a199f0572d7453b3f2d0b0"

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
