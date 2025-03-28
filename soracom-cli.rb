class SoracomCli < Formula
  VERSION = "1.4.0"
  SHA256_MAC_amd64 = "15372be94e0a3792a588c54aa7eef798348e80593a37464bbece9fb1f2db6f94"
  SHA256_MAC_arm64 = "4b3b694946c60dc1eac89149fa452c37fd2e8bb42c6d6a67be7a571233e3c4fa"
  SHA256_LINUX_amd64 = "396096883085dc039634a2fdf4b04a79087773ca633b463abc4369c505496b38"
  SHA256_LINUX_arm64 = "250d2d16c3f0999ae967b5ab726c9cb2db63bd0d66b71eb8ede912bd04540ed4"
  SHA256_LINUX_386 = "779ea9ad8c155a979e4c14960cd5c8c1e8a242eab401a2cb12fe68b5bcf86a68"
  SHA256_LINUX_arm = "b7d01fa747809e6f45fe47bb12bd55ba4d50fa6890226ea10122304354d0a637"

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
