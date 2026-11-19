class Neopane < Formula
  desc "One Neovim in the background, shown in every terminal attached to it"
  homepage "https://github.com/spiritledsoftware/neopane"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/spiritledsoftware/neopane/releases/download/v0.2.0/neopane-aarch64-apple-darwin.tar.gz"
      sha256 "12860a469c9e4ce55e2586dc3b9fb5399a2781575c6a5aeb9ab091de180d1f1d"
    else
      url "https://github.com/spiritledsoftware/neopane/releases/download/v0.2.0/neopane-x86_64-apple-darwin.tar.gz"
      sha256 "4b50ed674cc046273abc80719801eabf323b7959116e4d7e4e669eca913f274a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/spiritledsoftware/neopane/releases/download/v0.2.0/neopane-aarch64-unknown-linux-musl.tar.gz"
      sha256 "85f29c2382738d3f84cad3fa449480dc0ca7b8efb178c3291955df1621976dce"
    else
      url "https://github.com/spiritledsoftware/neopane/releases/download/v0.2.0/neopane-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e907e5909e4cbcaa5af88467fe7fa9873ddb18bff1c6fca40f15f07af35e30ad"
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
