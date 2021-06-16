class SoracomCli < Formula
  VERSION = "0.9.1"
  SHA256_MAC_amd64 = "f8e7b5702e654582ca0c920153ec72b35cfab6b446e1ba182c9d3aab825c2aad"
  SHA256_MAC_arm64 = "ce7739528335febc9c8ec9cde13dfe5da48551c6965d1896303db7073f93aa72"
  SHA256_LINUX_amd64 = "6febe7eac746f78dfc6ceeac538e811dffdf121fd8c178b194e3a90fa43352fe"
  SHA256_LINUX_arm64 = "398640600802b685019a5120079447a84bdf8faf320058f0eb70a6edb5191253"
  SHA256_LINUX_386 = "1f6698e6434bc0f718bc14803aadfd553b8a5f565f17ed23ce8ad369574f08c0"
  SHA256_LINUX_arm = "addca508cb686e081552f16164e631f8d2c67a51cc5e54724eee7b02670b1af6"

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
