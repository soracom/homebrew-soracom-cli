class SoracomCli < Formula
  VERSION = "0.14.0"
  SHA256_MAC_amd64 = "c30010111a732465f972c8cf1db3a30e06ffca58ee462764c7f34566831da9c2"
  SHA256_MAC_arm64 = "4909a38fa60a69ee3f49c5eba0003656e686befb6c56e883486e049614971b6e"
  SHA256_LINUX_amd64 = "bf0bfbe7092bbaf1171fb1c3bd8b7cc6c4d26815a69caa47280c0bb1942697a1"
  SHA256_LINUX_arm64 = "6666014842ba42f0128729b91b2d44ae9f0d568eeb333e6dbaa7d45037762390"
  SHA256_LINUX_386 = "2044aca502f68d197e95d21c8ca22f8369f95a434b985aab35acbf49b80caaff"
  SHA256_LINUX_arm = "42e8df7f33837767f399d62d63beebb051e4e90633576fbf218b027aca0977f4"

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
