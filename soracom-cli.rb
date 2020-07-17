class SoracomCli < Formula
  VERSION = "0.5.6"
  SHA256_MAC_32 = "09585f1e813a3d8cb9e25fea08953e1152352120ad89bff13bcf4237474ebef4"
  SHA256_MAC_64 = "3131bcdb83e24b941b9dfdc74e23a29bbf8cbb4769d7c154bc3e43585342ca6c"
  SHA256_LINUX_32 = "27d037739d2d380650087c540a425b4ebb495e565e5434d6272855cf55091638"
  SHA256_LINUX_64 = "1becc81b7d4a2708fd2795a986a3047c306bcf5d6d46a6ee3880e7e1a195d4b5"

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
