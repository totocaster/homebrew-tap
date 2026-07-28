class Arrowhead < Formula
  desc "Fast Obsidian search and discovery CLI and daemon"
  homepage "https://github.com/totocaster/arrowhead"
  version "0.11.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/totocaster/arrowhead/releases/download/v0.11.5/arrowhead-0.11.5-aarch64-apple-darwin.tar.gz"
      sha256 "6ddf2fcbbd80b874139f224aa8ac1243bb2e6da8436426f144ef6f61fcd0f742"
    end

    on_intel do
      url "https://github.com/totocaster/arrowhead/releases/download/v0.11.5/arrowhead-0.11.5-x86_64-apple-darwin.tar.gz"
      sha256 "66f5079a93e9657c9085f2b3017a4809f7adf479a11ca8554cbf6b3ce56a96be"
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
