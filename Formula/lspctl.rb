class Lspctl < Formula
  desc "Agent-facing Language Server Protocol command-line client"
  homepage "https://github.com/spiritledsoftware/lspctl"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/spiritledsoftware/lspctl/releases/download/v0.1.1/lspctl-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "8275a31c4b6a31009ba3e763f712e53b70bfb7a3400d30105dbc1f0d228437ca"
    else
      url "https://github.com/spiritledsoftware/lspctl/releases/download/v0.1.1/lspctl-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "c4869e09a80b2a7e5bd780835a9df56cf552756ce71db1289ace54e0c84765e0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/spiritledsoftware/lspctl/releases/download/v0.1.1/lspctl-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9a9516c51c5ef8645147b97974642bc42b03836031838ab34030cb7a7df97c71"
    else
      url "https://github.com/spiritledsoftware/lspctl/releases/download/v0.1.1/lspctl-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3d6114c2de91cd77c91b6056d1d50652dd7770e8748dd67d928acf15afba7155"
    end
  end

  def install
    bin.install "lspctl"
  end

  test do
    assert_match '"version":"0.1.1"', shell_output("#{bin}/lspctl version")
  end
end
