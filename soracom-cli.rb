class SoracomCli < Formula
  VERSION = "0.4.6"
  SHA256_MAC_32 = "0cb1ca1df86e7a37e269f8d52edc0d7f84e2bdae4c1bf3768d47b0eccb92ea0c"
  SHA256_MAC_64 = "6fce91cee42fb04e6eca835807bbba734886f18b2d1590e1abff6d68cf7649bf"
  SHA256_LINUX_32 = "8f910dec95408977ece79bfbba83a8ba138ef1657caae4acb929fca948bce416"
  SHA256_LINUX_64 = "65fcaa897f08d02a9a7d54e36a9b2820de00ffb28fad7b29704ad391857aa2bd"

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
