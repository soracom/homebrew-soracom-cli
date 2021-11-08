class SoracomCli < Formula
  VERSION = "0.10.4"
  SHA256_MAC_amd64 = "141aa9bb3016b8d616e4c9e027270c439d1b8ee6cae74d676428f450150e006a"
  SHA256_MAC_arm64 = "fc4cafa1b2ff53028409aecd992b6c81f762a524601e842cb4249589ad2b5ddc"
  SHA256_LINUX_amd64 = "7181d45d6441954bbf9199b9e0dc9b57855523c7655ffac0904d7d339010a4b1"
  SHA256_LINUX_arm64 = "2ac03592d4a59693ab817121fab44be2e1e4df939e031097b2607c9c17a67c31"
  SHA256_LINUX_386 = "68eddeb1ae1cad09df6a04234531d7f697d57c7731e397f1f04e26eab56a9ec8"
  SHA256_LINUX_arm = "c98327500e5f0adf7e90c57efffa171626db58490eecf83f762aabbf41234d81"

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
