class SoracomCli < Formula
  VERSION = "0.4.1"
  SHA256_MAC_32 = "20e0dba56f63b861ed7c9146306038d46e9ebb83e2f49a8b7f6d915961585aca"
  SHA256_MAC_64 = "e692f90a9a800034bbae52ad52cbec14cccc3e6fb358b30468001e8fdea3e141"
  SHA256_LINUX_32 = "2557ef4cc8cdd5fe99a5d2619ec6495d3ba8c93217a65c28e19bc5c083683083"
  SHA256_LINUX_64 = "f286a93914d40e7ab7b5c24a99bab9f5596494f2d74094a060fbebaebc139507"

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
