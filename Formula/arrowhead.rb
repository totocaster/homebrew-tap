class Arrowhead < Formula
  desc "Fast Obsidian search and discovery CLI and daemon"
  homepage "https://github.com/totocaster/arrowhead"
  version "0.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/totocaster/arrowhead/releases/download/v0.11.0/arrowhead-0.11.0-aarch64-apple-darwin.tar.gz"
      sha256 "cf4f7627a054738d3d0a52aedc32b1424a6599cdfa3e2586ade622acc3fc95d1"
    end

    on_intel do
      url "https://github.com/totocaster/arrowhead/releases/download/v0.11.0/arrowhead-0.11.0-x86_64-apple-darwin.tar.gz"
      sha256 "7067d66a2a322ca7ee2a14c777bb90b5a3207d76eb4ccc12d3c6ce4ffa4ea8be"
    end
  end

  def install
    bin.install "bin/arrowhead"
    bin.install "bin/arrowheadd"
  end

  test do
    output = shell_output("#{bin}/arrowhead --help")
    assert_match "arrowhead", output

    daemon_output = shell_output("#{bin}/arrowheadd --help")
    assert_match "arrowheadd", daemon_output
  end
end
