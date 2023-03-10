class SoracomCli < Formula
  VERSION = "0.15.1"
  SHA256_MAC_amd64 = "ea726a0f805c14528d732f4b643d803f32a235f5db1af7665fbad14d40763685"
  SHA256_MAC_arm64 = "2912d94df7b22792cd240477663b0ec28585f2007baaf3efbcb6c3dbc2b43b1d"
  SHA256_LINUX_amd64 = "11aaf8572f6716dd445b0a1fe4976cb4403fe5a8deef5ba8553c646177e6213f"
  SHA256_LINUX_arm64 = "f6b5928c5b7c79608b129f6694b32f175b461e66218a46578ba1b34ca5df3666"
  SHA256_LINUX_386 = "58ca2f489a274962d62bc97fcac446c761a70015f94dd6213c2d45d8d1fe3e32"
  SHA256_LINUX_arm = "254655b17384e0f9759ca9bc3eaed9f12d9cb17e008e3be9829fe4c386a8e1c8"

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
