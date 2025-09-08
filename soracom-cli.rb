class SoracomCli < Formula
  VERSION = "1.7.0"
  SHA256_MAC_amd64 = "81f8b170c783e246aebd1d082c79de9f6f2663b65fe8bb4294e38f48e647bb25"
  SHA256_MAC_arm64 = "879b94a07fb6a4bd7c013c4c41b7757c042e9c452a246d932cfe9a927d5cf608"
  SHA256_LINUX_amd64 = "81132951999df32b5bd883e9f9902de850ede7095ff7495d4be751ab85f339bb"
  SHA256_LINUX_arm64 = "b2d17b60fdd9a31935bf18efaa72e16379216e030bfec5e4ea352523631aa523"
  SHA256_LINUX_386 = "d4c41b5d28666ecc958ea0b1747d487a99a7a36a473e0784f6556d95dc2fb3bd"
  SHA256_LINUX_arm = "ba001e10f2dc36c0be8a11cc213f0e62a680ae448f5c86e475886fd4ad92c166"

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
