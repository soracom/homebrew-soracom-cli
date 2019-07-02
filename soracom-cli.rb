class SoracomCli < Formula
  VERSION = "0.4.5"
  SHA256_MAC_32 = "c65eb2136eac64c9fb94717846300e1920458e8c25e06b0775ac2c05c718458d"
  SHA256_MAC_64 = "f2819053a35f8b799dc54639bc45853f5b4108139a07f2079f7751425f2aaaf0"
  SHA256_LINUX_32 = "bb646f13f7c1ee998354f9afcda65cb49e92470cd7c1b37dcddf3f4075b0c7e3"
  SHA256_LINUX_64 = "fc6a03ba87bba04a595c7be3dde8c02c4638c712585f03151a79f0a457ab3acc"

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
