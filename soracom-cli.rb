class SoracomCli < Formula
  VERSION = "0.5.5"
  SHA256_MAC_32 = "b91074974585bda9903b181ef0bbb095b5c3eb8d423ca1839caae558e2e18f66"
  SHA256_MAC_64 = "e5e850c4b05ffd8b320770b8826057162f04c010456d0ddf3364d0333a7fbc7c"
  SHA256_LINUX_32 = "48b0ccef51f2a5dc13a7ec8565ddde010d3cab26e2a0482bb665f59c6a57be9d"
  SHA256_LINUX_64 = "78e8943804ead9a5728ab1d930b4df45f7e7e9cbfc18ae3d4547c55a5c414c26"

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
