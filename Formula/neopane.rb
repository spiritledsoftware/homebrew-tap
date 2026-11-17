class Neopane < Formula
  desc "One Neovim in the background, shown in every terminal attached to it"
  homepage "https://github.com/spiritledsoftware/neopane"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/spiritledsoftware/neopane/releases/download/v0.1.0/neopane-aarch64-apple-darwin.tar.gz"
      sha256 "a619d871650800ce649fe593cd7fac767657d8767f877ad9830a27690e29d93d"
    else
      url "https://github.com/spiritledsoftware/neopane/releases/download/v0.1.0/neopane-x86_64-apple-darwin.tar.gz"
      sha256 "b9ffe3765685ed05edfae17cc74504772165aa2461476ea446538538924f8e03"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/spiritledsoftware/neopane/releases/download/v0.1.0/neopane-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0e560d300fc572c6ef99bfa22f269b544ee4ddea7b1e6b3ca989d41b48cc738a"
    else
      url "https://github.com/spiritledsoftware/neopane/releases/download/v0.1.0/neopane-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0458bf5466f87f894c8fd78c6b5b8361e9d5becb75d5cc7d0a1bfce496abe1c4"
    end
  end

  def install
    bin.install "neopane"
    bin.install_symlink "neopane" => "npane"
  end

  def caveats
    <<~EOS
      neopane needs Neovim 0.12 or later, as nvim on PATH.
      A running daemon keeps the binary it started with: after an upgrade,
      end it (neopane kill) and start a new one.
    EOS
  end

  test do
    assert_match "neopane #{version}", shell_output("#{bin}/neopane --version")
    assert_match "neopane #{version}", shell_output("#{bin}/npane --version")
  end
end
