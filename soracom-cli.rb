class SoracomCli < Formula
  VERSION = "0.4.3"
  SHA256_MAC_32 = "d53595ae824c4c2c45cc0aedcb8b2bce0ae94d42774ba9f137275592c5e02102"
  SHA256_MAC_64 = "a281da8818ffb330aa1eb6f0018d92edc37f8d791ec4a83f013e36ad9dbd872a"
  SHA256_LINUX_32 = "7872ffeca7dccbbccede707ce0cc93d2458be61689ee03f432bcae4a9133b409"
  SHA256_LINUX_64 = "9a0538a0069492dac5254243fecc77e1176fa1219f23226ec94d73a990734207"

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
