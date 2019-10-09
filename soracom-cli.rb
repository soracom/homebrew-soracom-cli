class SoracomCli < Formula
  VERSION = "0.4.9"
  SHA256_MAC_32 = "f221d48613e9e5d5d99c32d98f72d6deff3612ebaaabe4a09f7d8bff7729d636"
  SHA256_MAC_64 = "e3d8281e2bb3b824886b1e3bc0591d028632833e244ab7e564bcd6022a232a4c"
  SHA256_LINUX_32 = "d8b985cfe5fc6180366afd68994418e68d12fea0265809255736ba07190c335d"
  SHA256_LINUX_64 = "8f02bd48c4941a1714f4eca67a5b8bb74fd225eb1ed0ffb9f7a7361da5bad68d"

  SHA256 = {
    'darwin' => {
      'amd64' => SHA256_MAC_64,
      '386'   => SHA256_MAC_32,
    },
    'linux' => {
      'amd64' => SHA256_LINUX_64,
      '386'   => SHA256_LINUX_32,
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

  if Hardware::CPU.is_64_bit?
    arch = 'amd64'
  else
    arch = '386'
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
