class SoracomCli < Formula
  VERSION = "0.15.2"
  SHA256_MAC_amd64 = "931efedc7170f043fc4c6bacc00256fc30ad0c72ba4027e5b3c0b1293bbaee19"
  SHA256_MAC_arm64 = "f813a661c537e4a49c7dccc5a723659c95c92b100094c969b99761f070887345"
  SHA256_LINUX_amd64 = "4cb3aff9b35ccc287f62e2bdcf2db5e559944807d6b8c8308b9bcd104f86b746"
  SHA256_LINUX_arm64 = "dbdaef20e961b58877789f9ddf655b467694fc5e7879794d0341a385828cbb6b"
  SHA256_LINUX_386 = "2d067426c8e370a219defa296b0641eff56c962bed8125be22bb0cae005b1232"
  SHA256_LINUX_arm = "683d8a3bf8ffd60443d3a02c172a83ea56900f7b747774cb92d1e282e6320888"

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
