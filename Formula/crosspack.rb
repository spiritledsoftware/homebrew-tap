class Crosspack < Formula
  desc "Native cross-platform package manager"
  homepage "https://github.com/spiritledsoftware/crosspack"
  url "https://github.com/spiritledsoftware/crosspack/archive/refs/tags/v0.15.1.tar.gz"
  sha256 "03c9f7deac2b32094a5a2867ba59badc9a8ba7a69c9e00cae9b47c1fb1bc5fd0"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/crosspack-cli")

    generate_completions_from_executable(bin/"crosspack", "completions", shells: [:bash, :zsh, :fish])
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/crosspack version").strip
    assert_equal version.to_s, shell_output("#{bin}/cpk version").strip
  end
end
