class SoracomCli < Formula
  VERSION = "1.9.0"
  SHA256_MAC_amd64 = "d88eae6dd68f0039ee55ba9ed8ce4ec9dde94c9ab48bab86f3c541c6b6e0afbd"
  SHA256_MAC_arm64 = "93c54456f3d92cbe2d581cc9fdbb02f7d30a63d689dc8d8d5303b7a4a67642cd"
  SHA256_LINUX_amd64 = "76d0a1fa757e2014cc19d526ff6a6aa74c66b34d6ac586cf0e55a33ce1ff36ab"
  SHA256_LINUX_arm64 = "ccd278704d83897275d0410ccaa7203a07d1c2593dadb15a12a1c42dc6b43f4d"
  SHA256_LINUX_386 = "6f813efb0f549a54c88759427b0d57231252e2f3c2797d6e84b91ab8f0ba9174"
  SHA256_LINUX_arm = "77f2de8d096b14a11cc3d5e4977649aec8948b31c5f1679ecc5d1de254ec19e4"

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
