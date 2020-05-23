class SoracomCli < Formula
  VERSION = "0.5.4"
  SHA256_MAC_32 = "d7eab0f3f975d8c570223642631d6f05eaeac15d666557b7ce2a61c4cf14cd87"
  SHA256_MAC_64 = "20cdc15b1116b91a7db73a3b9032265ea1e32da1c8dac927a7fda0768cf6182c"
  SHA256_LINUX_32 = "ca8b43dc968c3da51fb0bd2fd47c92a5cdb6e4e565433ad85607ca762c72ea40"
  SHA256_LINUX_64 = "9cced40d3dfae49b19fa1ec8247829b471747e129a677a4d0f1643f9a9ff52a3"

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
