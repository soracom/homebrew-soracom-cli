class SoracomCli < Formula
  VERSION = "0.5.0"
  SHA256_MAC_32 = "c9ba6510c22cfb545f6e1e632dcf6fca22e175dc27f3dba9556e859edc369848"
  SHA256_MAC_64 = "7286cbd62b2dbcd0c37b6a7087df6051ce29610a207233c1ceb3a7a569b684c4"
  SHA256_LINUX_32 = "9bfe3c61d77a09322197cef0f68e68cbfdfd6c03d4cd52797cc4e72a590b497b"
  SHA256_LINUX_64 = "52a18a76094573143190571826aeee7d57d0a298bf474e5bc50fdcc5c1d11aa3"

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
