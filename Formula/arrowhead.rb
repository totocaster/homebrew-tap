class Arrowhead < Formula
  desc "Fast Obsidian search and discovery CLI and daemon"
  homepage "https://github.com/totocaster/arrowhead"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/totocaster/arrowhead/releases/download/v0.10.0/arrowhead-0.10.0-aarch64-apple-darwin.tar.gz"
      sha256 "89ac5aa4f10cb9abe5480b8794222c97e91c1977f8e93b54fed0b0f7af7d0b35"
    end

    on_intel do
      url "https://github.com/totocaster/arrowhead/releases/download/v0.10.0/arrowhead-0.10.0-x86_64-apple-darwin.tar.gz"
      sha256 "f2c12c3790b1b8370cc214334cea2927a9947b757d383a66cdf44ada881fa2bc"
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
