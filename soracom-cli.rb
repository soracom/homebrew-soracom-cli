class SoracomCli < Formula
  VERSION = "0.6.1"
  SHA256_MAC_32 = "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  SHA256_MAC_64 = "321c3a334c680478f56343d4a36dd26e6e379c924e7bafd6031d6124fec5eddf"
  SHA256_LINUX_32 = "03badf3fdbf4b0b65757cd60d6d5ccc55185f52ebb0bf30687225c326cfbb1e6"
  SHA256_LINUX_64 = "11f024dd5d183a2d7457d301ed17a2cf6891af2a092279d57e72330ccbf2a727"

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
