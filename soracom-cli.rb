class SoracomCli < Formula
  VERSION = "0.4.2"
  SHA256_MAC_32 = "100a7baae1cd5918ceca7580363ba511fc82ee4fe908c93ee94131ead3247489"
  SHA256_MAC_64 = "1080bcb7a0a69cf5f1b329b0d0811784368a980d3ada3fc45c18cc47b40e4e7c"
  SHA256_LINUX_32 = "029abe97a5bf964a292396bcdd57eb5da8a624ab153d8ad8f67ff893a6734fd9"
  SHA256_LINUX_64 = "70e10470e62021a9e7da800dbb142a9743376e3d346a20aa51dbe00daeff6aa9"

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
