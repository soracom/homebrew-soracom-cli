class SoracomCli < Formula
  VERSION = "0.8.0"
  SHA256_MAC_amd64 = "090405cf5310e6b1c8f3744dffc6684afbfec8323b82e5e32e9c73f051eb480f"
  SHA256_MAC_arm64 = "1f8f50b98d897e2e610a70feb006f8e050f668b81b1919dfab19cfc448e46783"
  SHA256_LINUX_amd64 = "658e5c1f11e7ec666e3a66c252d21e81281a1798cba519189f7bafe56ee08c99"
  SHA256_LINUX_arm64 = "bcc2019990a478d646aeb0108d6255a2f1c435422c4c7005cd3dfa508c814a31"
  SHA256_LINUX_386 = "84be22e5d0bb76818cc4a5511a4b1d85ee1ead121fa9b716cb2de735504af2b1"
  SHA256_LINUX_arm = "35856cbb2025aca01c8a69fa9f7f298079272d0eab81b53cfc954971ea5ad6e4"

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

  case `uname -m`
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
