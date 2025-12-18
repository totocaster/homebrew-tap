class Arrowhead < Formula
  desc "Fast Obsidian search and discovery CLI and daemon"
  homepage "https://github.com/totocaster/arrowhead"
  version "0.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/totocaster/arrowhead/releases/download/v0.8.1/arrowhead-0.8.1-aarch64-apple-darwin.tar.gz"
      sha256 "ef03f863c9bbca55a9d5206901b7c83328926bc9e0df6265f363b9fa7fe23d7d"
    end

    on_intel do
      url "https://github.com/totocaster/arrowhead/releases/download/v0.8.1/arrowhead-0.8.1-x86_64-apple-darwin.tar.gz"
      sha256 "b2a937c50940cbfffbe5b9187f6990c4fe6e953b574db162f095a3f966a68398"
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
