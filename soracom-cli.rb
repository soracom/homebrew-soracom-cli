class SoracomCli < Formula
  VERSION = "1.1.0"
  SHA256_MAC_amd64 = "af84022b2e5b6fad3f1e6a89b163bc638d62ade5432a3d3ca561b513105a1ac0"
  SHA256_MAC_arm64 = "8679e29126e7b4e8ac27a5013db75b5d4cf854967be56b021b50f0c00ccd7bd2"
  SHA256_LINUX_amd64 = "b32a1b152784142cfd75bd85cdcc5927d545d373dc8c52511663d31a357fed52"
  SHA256_LINUX_arm64 = "d358af632e7a5be2bf235b8524c700ca5fe6f5ae6da30f0de813e45d00314359"
  SHA256_LINUX_386 = "95741cd70de1f0529aafacdf1ef802ff2a60cb4235397da9ef717ab968a1e975"
  SHA256_LINUX_arm = "c1dd45447ec4c4097a5a8c440cd62d6d15d5efed970024d5660e7a67726ea991"

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
