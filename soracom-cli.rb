class SoracomCli < Formula
  VERSION = "0.4.7"
  SHA256_MAC_32 = "c3666d1872de74b90bcca80eb49a35ce3be7e03c16b18a5ab6283d6b4ba7b1c6"
  SHA256_MAC_64 = "e559e0fdb33246adcc99298b131a8f776e9f77755b4b28ba5a53c9edc2820546"
  SHA256_LINUX_32 = "44faeb66c48193c007808c00545684b42614d5f49c7186f43acf75df8eaa1c92"
  SHA256_LINUX_64 = "c50e76be7ca1240852f85999cc48c2ba1227168e2ea6058b748efe8c57dc90b2"

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
