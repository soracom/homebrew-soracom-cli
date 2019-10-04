class SoracomCli < Formula
  VERSION = "0.4.8"
  SHA256_MAC_32 = "e959362e6f4d6197ac18e961ba1007c56265ed04748752a3fb6bfcfa76529ce7"
  SHA256_MAC_64 = "5fd7ed7fbb52548c96c48c8e3c12cb6d5c9c65936ae5209f544e601089265e76"
  SHA256_LINUX_32 = "6b78e886103cbe0a3d31f6bdee917f5dfe022057abd17a706bcf5861d231dd97"
  SHA256_LINUX_64 = "b83b0037085eff3e5158b8bfad3327197b841ec7f1d5fb4dc3cdb20d37a3ab6b"

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
