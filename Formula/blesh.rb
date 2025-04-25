# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Blesh < Formula
  desc "Bash Line Editor―a line editor written in pure Bash with syntax highlighting, auto suggestions, vim modes, etc. for Bash interactive sessions."
  homepage "https://github.com/akinomyoga/ble.sh"
  license "BSD-3-Clause"
  head "https://github.com/akinomyoga/ble.sh.git", branch: "master"
  url "https://github.com/akinomyoga/ble.sh.git",
    tag: "v0.4.0-devel3",
    revision: "1a5c451c8baa71439a6be4ea0f92750de35a7620"
  version "0.4.0-devel3"

  depends_on "gawk" => :build
  depends_on "fzf" 
  depends_on "bash-preexec" 

  def install
    system "make", "install" # if this fails, try separate make/make install steps
    (prefix/"etc/profile.d").install "out/ble.sh" => "ble.sh"
  end
  def caveats
    <<~EOS
      Add the following line to your bash profile (e.g. ~/.bashrc, ~/.profile, or ~/.bash_profile)
        [ -f #{etc}/profile.d/ble.sh ] && . #{etc}/profile.d/ble.sh
    EOS
  end

  test do
    # Just testing that the file is installed
    assert_path_exists testpath/"#{prefix}/etc/profile.d/ble.sh"
  end
end
