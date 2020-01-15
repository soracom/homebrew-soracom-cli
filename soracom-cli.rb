class SoracomCli < Formula
  VERSION = "0.5.2"
  SHA256_MAC_32 = "c0f3a93a40e7ac4e33fee1690fbb405a05f0678843a61f1e6e93d7d6149a3a28"
  SHA256_MAC_64 = "a81781a6cb3fc1ab745f22e240915b96b26770c590e22da9d5ebeb17ee79cd2c"
  SHA256_LINUX_32 = "2a1fe492796f23ef3f6a2d564d2bfb6d5c9b7f5a701eb96c8add458cae8b3f58"
  SHA256_LINUX_64 = "cd80c1097bfc14a669fa51ca0d6acf7d2e37efd38444ed29bc79b5f78029ecb1"

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
