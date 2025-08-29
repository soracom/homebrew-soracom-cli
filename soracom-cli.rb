class SoracomCli < Formula
  VERSION = "1.6.1"
  SHA256_MAC_amd64 = "7ecdec07cc670e12d25438bf8865085ee3a90fad5a0379770b140013a2d284bb"
  SHA256_MAC_arm64 = "2df82891f83da92d90890ddd1a1fab35de7a4d8ef175ed1cac23b329415e9d04"
  SHA256_LINUX_amd64 = "3ee0faa0d4909e3d352fc585ec52d7ca57726f61ca35680f2fcb172bc7123834"
  SHA256_LINUX_arm64 = "26ecdabaa4ee9d7388f1ebfc2d2a03b0c897c9305e45405626a0aa2ea87253ac"
  SHA256_LINUX_386 = "3c825aead2d1d5a48161b5f7b6353937ae6368c9c3ce4685e57a259b53c93b4c"
  SHA256_LINUX_arm = "cbf7aa81e2945ebc520349bb0c1b5fc1d98ae3251f0cb01cecf48cba3a8ab069"

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
