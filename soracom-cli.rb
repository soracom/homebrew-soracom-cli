class SoracomCli < Formula
  VERSION = "1.1.1"
  SHA256_MAC_amd64 = "8b91bdb687894cded9bb018ef34d380da5e98a3e0bd9256cb694ed613687783d"
  SHA256_MAC_arm64 = "e994e9f31212bb72f8fd8e59ec9f739ebe1141afbc7a85721c1f4ce28b75c136"
  SHA256_LINUX_amd64 = "f766d01a12341c0717e6c5c89d4adc97c0be9e6e9bef4336b5b73b26a9512b4c"
  SHA256_LINUX_arm64 = "5d2f1926399a3fa37f867d49d9e96253add2b69ecf3ab476ccfe8566677a5938"
  SHA256_LINUX_386 = "5d83df5bbcabfaaa9235545da0d74af109b7bd0740664c27c4d1b5374ada510e"
  SHA256_LINUX_arm = "f7599d585bb2ea332f8f9f7f5e4784fb7131c938bf4823f8e22774096d6f2de3"

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
  license "MIT"

  def install
    mv @@binname, 'soracom'
    bin.install 'soracom'
  end

  test do
    system "false"
  end
end
