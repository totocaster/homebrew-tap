class Arrowhead < Formula
  desc "Fast Obsidian search and discovery CLI and daemon"
  homepage "https://github.com/totocaster/arrowhead"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/totocaster/arrowhead/releases/download/v0.9.0/arrowhead-0.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "bdb9e2c24cc51f404d55e34f6616c1d0c8f00f12270bb253eed4bfa5519fa77d"
    end

    on_intel do
      url "https://github.com/totocaster/arrowhead/releases/download/v0.9.0/arrowhead-0.9.0-x86_64-apple-darwin.tar.gz"
      sha256 "2fc6560bfc141d7538579f87d828cc9c7f3fc1728cf78cd5b3ef75421d3544e2"
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
