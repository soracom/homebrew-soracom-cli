class SoracomCli < Formula
  VERSION = "0.4.0"
  SHA256_MAC_32 = "f0e4f199f70766a4786c1b6447267ae215c9500f1a4215f0398265c803d50bda"
  SHA256_MAC_64 = "b92e96684bcb345f0f5bac88d3598676ff7d261281cebc3d4b4811cbcbb5cd5a"
  SHA256_LINUX_32 = "cce975d902fe8ae2a6317aa34eff9a06c901dd8275bd1a7ea34c6498587ff41c"
  SHA256_LINUX_64 = "211ece68b6c4ef25707160cb94c5aa8c46eb107b208c28ca291323462898a223"

  SHA256 = {
    :darwin => {
      :amd64 => SHA256_MAC_64,
      :386   => SHA256_MAC_32,
    },
    :linux => {
      :amd64 => SHA256_LINUX_64,
      :386   => SHA256_LINUX_32,
    },
  }

  desc "A command line tool to invoke SORACOM API"
  homepage "https://github.com/soracom/soracom-cli"
  version VERSION

  if OS.mac?
    os = :darwin
  else
    os = :linux
  end

  if Hardware::CPU.is_64_bit?
    arch = :amd64
  else
    arch = :386
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
