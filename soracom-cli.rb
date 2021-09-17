class SoracomCli < Formula
  VERSION = "0.10.1"
  SHA256_MAC_amd64 = "b64501a689338e0144227e66451e2b5fb4bd731615fb8cdefdd10064bbbd0a48"
  SHA256_MAC_arm64 = "49bd928cddf4d3e108eb157e93c414caeadc1adbd2a8ba01d15c5b9fa502e209"
  SHA256_LINUX_amd64 = "85854f7220dc97b75ed3b9055dc37095fc453e36d35fdb4bc617c9dd8229b13b"
  SHA256_LINUX_arm64 = "f4adaf83a6db5d146bfdb3f4f9bef558a1afd97b1dfc2a7949060cdd5bcb931c"
  SHA256_LINUX_386 = "1b22313d221ce6b406e8206a0ce41a931bad093179a2302cce0b9ed715795b04"
  SHA256_LINUX_arm = "c347f7c7bbd4201fa84bc353f4301129be397cc979101592cf4625af6fdffae4"

  SHA256 = {
    'darwin' => {
      'amd64' => SHA256_MAC_amd64,
      'arm64' => SHA256_MAC_arm64,
    },
    'linux' => {
      'amd64' => SHA256_LINUX_amd64,
      'arm64' => SHA256_LINUX_arm64,
      '386'   => SHA256_LINUX_386,
      'arm'   => SHA256_LINUX_arm,
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

  case `uname -m`.chomp!
  when 'x86_64'
    arch = 'amd64'
  when 'arm64', 'aarch64'
    arch = 'arm64'
  when 'i686'
    arch = '386'
  when 'armv6l', 'armv7l'
    arch = 'arm'
  else
    puts "unknown arch: #{`uname -m`}"
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
