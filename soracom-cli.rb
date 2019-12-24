class SoracomCli < Formula
  VERSION = "0.5.1"
  SHA256_MAC_32 = "190b3f65ad434f31209ee9a973d7481cdb97431966a82321fff425298786fb9a"
  SHA256_MAC_64 = "c765c886b45d5e4e1857b330ef838fd6edeff0f12dbdfc614d5e0b1eb524d096"
  SHA256_LINUX_32 = "34ccd74ca83e611feaa71808e428cc0db5fb09f4caaf0a5c69a2feb0e9c58bcc"
  SHA256_LINUX_64 = "2a28f0f3767b256f4b5aaefc21d835fc77678a103a77ea0b3a4caddc0ccec043"

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
