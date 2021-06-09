class SoracomCli < Formula
  VERSION = "0.9.0"
  SHA256_MAC_amd64 = "94ad058c1fe71a81d2b06613c5803e8b5adc2682a3810df6b3bee1863670f39b"
  SHA256_MAC_arm64 = "5e440667275b0f52139117ad7b366d9f4c2f5cdef1dcc996735ad178036b6767"
  SHA256_LINUX_amd64 = "f15371e3ba6e7db8e32b957fcddc324911084b3085c214cc567f2a3700f37824"
  SHA256_LINUX_arm64 = "a95e16028ead3effca164b18dad8d754ace551ab3d671a71f1520e696f229e26"
  SHA256_LINUX_386 = "20b9fb99935ae733a741403747d8c039ff1adb890670035ba8fb4abd36f651e9"
  SHA256_LINUX_arm = "5b290d24609632a8a0c1c60486d5d3caac2b405f6d3206a82fd9d0ef97eb6574"

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
