class Arrowhead < Formula
  desc "Fast Obsidian search and discovery CLI and daemon"
  homepage "https://github.com/totocaster/arrowhead"
  version "0.11.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/totocaster/arrowhead/releases/download/v0.11.1/arrowhead-0.11.1-aarch64-apple-darwin.tar.gz"
      sha256 "803fb7ae40ea56b88b83df731022c61baba0f8c6ea7c02e0c2c87e2f75787963"
    end

    on_intel do
      url "https://github.com/totocaster/arrowhead/releases/download/v0.11.1/arrowhead-0.11.1-x86_64-apple-darwin.tar.gz"
      sha256 "c088a907434680220bed14d78998ec77f54a600535db463d695518fe6c526685"
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
