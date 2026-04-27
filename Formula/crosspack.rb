class Crosspack < Formula
  desc "Native cross-platform package manager"
  homepage "https://github.com/spiritledsoftware/crosspack"
  url "https://github.com/spiritledsoftware/crosspack/archive/refs/tags/v0.12.0.tar.gz"
  sha256 "9e05a97d8508129c31e45d84db6e79f196be09db760834293a0feac522f967a4"
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
