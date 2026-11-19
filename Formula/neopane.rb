class Neopane < Formula
  desc "One Neovim in the background, shown in every terminal attached to it"
  homepage "https://github.com/spiritledsoftware/neopane"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/spiritledsoftware/neopane/releases/download/v0.2.2/neopane-aarch64-apple-darwin.tar.gz"
      sha256 "9eeed90aeb822fbee42466bdf84d4f9860b2eb917fe0dc4871048398578b224f"
    else
      url "https://github.com/spiritledsoftware/neopane/releases/download/v0.2.2/neopane-x86_64-apple-darwin.tar.gz"
      sha256 "4ae1901255ea0a27280b92d30d92907d6be11280acb482a7b8ed77e9c860b256"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/spiritledsoftware/neopane/releases/download/v0.2.2/neopane-aarch64-unknown-linux-musl.tar.gz"
      sha256 "43db215abf8e9521ee1ef1c7e2fb7e08d8c1651c1f9a25051fdddede57667da9"
    else
      url "https://github.com/spiritledsoftware/neopane/releases/download/v0.2.2/neopane-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e18ceeb049d886b8274c43d608ab866e1d38459cb6d64f985874d3bd24686c8e"
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
