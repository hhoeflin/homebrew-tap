class Apm < Formula
  desc "Manage AI coding agent profiles across OpenCode, Claude, Cursor, and Copilot"
  homepage "https://github.com/hhoeflin/agent_profile_manager"
  url "https://github.com/hhoeflin/agent_profile_manager/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "1f3a337cc731115d3b9b7bcfaa70318135a6110f6a3430716119d97603202959"
  license "MIT"
  head "https://github.com/hhoeflin/agent_profile_manager.git", branch: "master"

  livecheck do
    url "https://github.com/hhoeflin/agent_profile_manager/releases/latest"
    strategy :github_latest
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/apm --version")
  end
end
