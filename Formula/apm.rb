class Apm < Formula
  desc "Manage AI coding agent profiles across OpenCode, Claude, Cursor, and Copilot"
  homepage "https://github.com/hhoeflin/agent_profile_manager"
  url "https://github.com/hhoeflin/agent_profile_manager/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "11e0cff0af8921494f263fbb3a5df12f399ef4a7d5de260f927941dbbd9e28ba"
  license "MIT"
  head "https://github.com/hhoeflin/agent_profile_manager.git", branch: "master"

  livecheck do
    url "https://github.com/hhoeflin/agent_profile_manager/releases/latest"
    strategy :github_latest
  end

  depends_on "pkgconf" => :build
  depends_on "rust" => :build
  depends_on "openssl@3"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/apm --version")
  end
end
