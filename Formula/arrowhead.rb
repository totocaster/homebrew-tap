class Arrowhead < Formula
  desc "Fast Obsidian search and discovery CLI and daemon"
  homepage "https://github.com/totocaster/arrowhead"
  version "0.11.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/totocaster/arrowhead/releases/download/v0.11.2/arrowhead-0.11.2-aarch64-apple-darwin.tar.gz"
      sha256 "4837f3ab077a885c74ae7a5a7f318f5be9fff722d6556ec275542c6d54aa43b3"
    end

    on_intel do
      url "https://github.com/totocaster/arrowhead/releases/download/v0.11.2/arrowhead-0.11.2-x86_64-apple-darwin.tar.gz"
      sha256 "4e6999efbffceece191d7410fbc064428e6999547af872027bd60e05394f7c98"
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
