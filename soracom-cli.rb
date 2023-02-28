class SoracomCli < Formula
  VERSION = "0.15.0"
  SHA256_MAC_amd64 = "eebee290dfc9472d839f8c4c76df3ba2cf4cb2b0dec2fae737cb83a677afd083"
  SHA256_MAC_arm64 = "4c6ca98acb51c0abe98a06f403102047ad338f989060710a1232feafb57622fc"
  SHA256_LINUX_amd64 = "45fb567642f685bf4c1488fd13daa64211384833af4aafaf68166a17804adf68"
  SHA256_LINUX_arm64 = "f5a3ebad7a0abbdef945ce769aa686b864a0ae1dfa3cafca2ac4adf41c969d0f"
  SHA256_LINUX_386 = "16b7d4d1bdf1a3d56bf5e4b2b0ea1a2d66296e41c9d65406d58ba8beab2f5da1"
  SHA256_LINUX_arm = "e577e6147e8265b734ad3eaf70159bf53ac17eb0a40b6bf0e86d3e71e67e4737"

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
