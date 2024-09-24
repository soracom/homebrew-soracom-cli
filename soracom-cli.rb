class SoracomCli < Formula
  VERSION = "1.3.0"
  SHA256_MAC_amd64 = "b867b8fcef4b51eee86909d713c91119c7cc469fcaf09816ea1e34f1a3e0be75"
  SHA256_MAC_arm64 = "77e8d2a9b8ae3f9de5df1bb552b5be65042a44bf6ad511174782ffe8185a3afe"
  SHA256_LINUX_amd64 = "f1081754f0f542a59785e02574333110160048b5a697f0217a064f002a80c464"
  SHA256_LINUX_arm64 = "f3522c509ea638788f1c383478370dd3c1fa7411688cce5ed2a1048a12e815c2"
  SHA256_LINUX_386 = "d7916dd6f8ce2eb656cdb9c6ede65ff583c184ee95500c931148d2764220a419"
  SHA256_LINUX_arm = "b9e5112c445818fc0aafc251f0cb51158bc211de8892c8c30769d77cab416e9e"

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
