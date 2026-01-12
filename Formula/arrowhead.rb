class Arrowhead < Formula
  desc "Fast Obsidian search and discovery CLI and daemon"
  homepage "https://github.com/totocaster/arrowhead"
  version "0.8.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/totocaster/arrowhead/releases/download/v0.8.2/arrowhead-0.8.2-aarch64-apple-darwin.tar.gz"
      sha256 "b53fbfa585252d8b66831cb3655ec802245f57a857a36dfce6ec019a7fa6c9ff"
    end

    on_intel do
      url "https://github.com/totocaster/arrowhead/releases/download/v0.8.2/arrowhead-0.8.2-x86_64-apple-darwin.tar.gz"
      sha256 "dab4ed6713875864d3a800d11ea0886b9654745ec0225575b3722d55d7da7f2c"
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
