class SoracomCli < Formula
  VERSION = "0.11.0"
  SHA256_MAC_amd64 = "ed631738b368d6e05dd5eb46aed9822556b72d02c73578c3cf8d2499374ff78b"
  SHA256_MAC_arm64 = "414abe5b11b382a5a81c369110441690d2cbe0e8d097f291ac031a50403cc7f6"
  SHA256_LINUX_amd64 = "eb078ca0a3ee7424855f698919fc5df8b5ae92b4f60e17ebf4eb4b5fdc349d3b"
  SHA256_LINUX_arm64 = "e3dcbf6a3493723ac05fb3a9eb959abacd01372e6392c2eda95086f8fd7eea11"
  SHA256_LINUX_386 = "a5fe70d1666430c917f4064e7359d5e60cb8430cfb3f553725e385c1df3a9193"
  SHA256_LINUX_arm = "a9441ae8865e6f60a330a6e0f4c6e81e1a78c488eda80f4f38c3d003d25f99c0"

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
