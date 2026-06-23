class Arrowhead < Formula
  desc "Fast Obsidian search and discovery CLI and daemon"
  homepage "https://github.com/totocaster/arrowhead"
  version "0.11.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/totocaster/arrowhead/releases/download/v0.11.3/arrowhead-0.11.3-aarch64-apple-darwin.tar.gz"
      sha256 "faffe00b38e40d85109a5cf3255cc6ca0c78b23bebfbf4d4339bb3bf9d611c86"
    end

    on_intel do
      url "https://github.com/totocaster/arrowhead/releases/download/v0.11.3/arrowhead-0.11.3-x86_64-apple-darwin.tar.gz"
      sha256 "47497ea1901e58aa3c0ad570859008e72c68777db159bbfaa3f07392ada5352e"
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
