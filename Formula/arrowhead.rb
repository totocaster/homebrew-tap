class Arrowhead < Formula
  desc "Fast Obsidian search and discovery CLI"
  homepage "https://github.com/totocaster/arrowhead"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/totocaster/arrowhead/releases/download/v0.5.0/arrowhead-0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "f28eaf0a092a4d263d122d66f66a5f5393eebf28db7a5c49c04060cd86f8dd81"
    end

    on_intel do
      url "https://github.com/totocaster/arrowhead/releases/download/v0.5.0/arrowhead-0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "56fd6933c25bd4c365b31c06f1b3c674d361e0d08f9b49835faf85c9f9324612"
    end
  end

  def install
    bin.install "bin/arrowhead"
  end

  test do
    output = shell_output("#{bin}/arrowhead --help")
    assert_match "arrowhead", output
  end
end
