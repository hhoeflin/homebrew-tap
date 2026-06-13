class Grepai < Formula
  desc "Privacy-first semantic code search CLI"
  homepage "https://github.com/yoanbernabeu/grepai"
  url "https://github.com/yoanbernabeu/grepai/archive/refs/tags/v0.35.0.tar.gz"
  sha256 "2b19f4f7f1fa2dd9830602cd3d08e4e7b5eb64b6b4e3122f521aeb386eee5099"
  license "MIT"
  head "https://github.com/yoanbernabeu/grepai.git", branch: "main"

  livecheck do
    url "https://github.com/yoanbernabeu/grepai/releases/latest"
    strategy :github_latest
  end

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    system "go", "build", *std_go_args(
      output:  bin/"grepai",
      ldflags: ["-s", "-w", "-X", "main.version=#{version}"],
    ), "./cmd/grepai"
  end

  def caveats
    <<~EOS
      grepai needs a local embedding provider. Recommended setup:
        brew install ollama
        ollama pull nomic-embed-text
      Then in your project:
        grepai init
        grepai watch
    EOS
  end

  test do
    assert_match version.to_s, shell_output(bin/"grepai", "--version")
  end
end
