class Arrowhead < Formula
  desc "Fast Obsidian search and discovery CLI and daemon"
  homepage "https://github.com/totocaster/arrowhead"
  version "0.7.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/totocaster/arrowhead/releases/download/v0.7.1/arrowhead-0.7.1-aarch64-apple-darwin.tar.gz"
      sha256 "3b412cbdb7993f2cf925b07ec77b371506f6ebdf168dbf0004046c8003a74f74"
    end

    on_intel do
      url "https://github.com/totocaster/arrowhead/releases/download/v0.7.1/arrowhead-0.7.1-x86_64-apple-darwin.tar.gz"
      sha256 "17d75e91c286928814ba48c847c91a243a5420e2cfe1d11fa23e35e7734d827e"
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
