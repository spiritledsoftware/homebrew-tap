class Crosspack < Formula
  desc "Native cross-platform package manager"
  homepage "https://github.com/spiritledsoftware/crosspack"
  url "https://github.com/spiritledsoftware/crosspack/archive/refs/tags/v0.10.5.tar.gz"
  sha256 "bbf9fc31416b35c3654376ac64877db7ffcdd62d68fabde589f307308bd49d90"
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
