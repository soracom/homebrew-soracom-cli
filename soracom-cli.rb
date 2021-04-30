class SoracomCli < Formula
  VERSION = "0.7.1"
  SHA256_MAC_32 = "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  SHA256_MAC_64 = "a12fe4049c4a7334c80423f6d65eda43625c72ac4d452ceb72c573f9d05cdd74"
  SHA256_LINUX_32 = "e16a8dfc8be62d915d7d120c020ca61007d285e58e4c6415c73349d1878e50bd"
  SHA256_LINUX_64 = "f04f3f05d01328f6d39c21b7257aa8f5d0503c739afc76e7565bf553db146783"

  SHA256 = {
    'darwin' => {
      'amd64' => SHA256_MAC_64,
      '386'   => SHA256_MAC_32,
    },
    'linux' => {
      'amd64' => SHA256_LINUX_64,
      '386'   => SHA256_LINUX_32,
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

  if Hardware::CPU.is_64_bit?
    arch = 'amd64'
  else
    arch = '386'
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
