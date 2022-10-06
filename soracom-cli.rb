class SoracomCli < Formula
  VERSION = "0.13.0"
  SHA256_MAC_amd64 = "30326be97a70c43458eadd2e36e034c12cf88e390daa1418ef6fe67295e778fe"
  SHA256_MAC_arm64 = "44539435f66fc83e03a844a8f74a370c98bea0baac944f4e0d19e9a885a4a4c0"
  SHA256_LINUX_amd64 = "209017399fb6ca88b8c3d805b25840195c95fa2ecb4b8b7a29f887b4816a7dfe"
  SHA256_LINUX_arm64 = "00b9bf8e830254ce5fb386d8b4821b39ec5346f12857bf6d7d503e5e4f97b461"
  SHA256_LINUX_386 = "a62a253ad86491ddb11d6505b4f3dbae30544c9519abba78f36699fa65b020c6"
  SHA256_LINUX_arm = "c8741a06c8cede9c32bfab64cd5d6e816ff73cba4823a599207e2c20ea7fe82a"

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
