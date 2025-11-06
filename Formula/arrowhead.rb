class Arrowhead < Formula
  desc "Fast Obsidian search and discovery CLI and daemon"
  homepage "https://github.com/totocaster/arrowhead"
  version "0.7.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/totocaster/arrowhead/releases/download/v0.7.5/arrowhead-0.7.5-aarch64-apple-darwin.tar.gz"
      sha256 "ff265d0098a34cb7785b331416806d0e3d96fdf000a629755e52917201acea33"
    end

    on_intel do
      url "https://github.com/totocaster/arrowhead/releases/download/v0.7.5/arrowhead-0.7.5-x86_64-apple-darwin.tar.gz"
      sha256 "65c67ab3388f118b7eccc5baa8f982e0b9a252852113c08a458a9706d938a453"
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
