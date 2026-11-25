class Neopane < Formula
  desc "One Neovim in the background, shown in every terminal attached to it"
  homepage "https://github.com/spiritledsoftware/neopane"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/spiritledsoftware/neopane/releases/download/v0.2.3/neopane-aarch64-apple-darwin.tar.gz"
      sha256 "26a1e1aecb371c7862fdf92b8cf9de00ef7598f637befebcc31de0b249f5f9e4"
    else
      url "https://github.com/spiritledsoftware/neopane/releases/download/v0.2.3/neopane-x86_64-apple-darwin.tar.gz"
      sha256 "6948e5f766a6170fd23d3ee540f4259a54730b529adf1b59d062757618acc547"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/spiritledsoftware/neopane/releases/download/v0.2.3/neopane-aarch64-unknown-linux-musl.tar.gz"
      sha256 "dbc5c98f857ef4a4fb797a1cfef84311cd3e6fbc082247db0ca7fb9b672b0130"
    else
      url "https://github.com/spiritledsoftware/neopane/releases/download/v0.2.3/neopane-x86_64-unknown-linux-musl.tar.gz"
      sha256 "18d78278a923b02462ddd0d065772e88088334deeba28aa661c7d08057736167"
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
