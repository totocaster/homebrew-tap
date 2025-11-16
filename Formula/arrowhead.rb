class Arrowhead < Formula
  desc "Fast Obsidian search and discovery CLI and daemon"
  homepage "https://github.com/totocaster/arrowhead"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/totocaster/arrowhead/releases/download/v0.8.0/arrowhead-0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "5f45267a8ff8d4982cfe3bd8d0ca4192571dc3202ddb687b336db0e4026b217c"
    end

    on_intel do
      url "https://github.com/totocaster/arrowhead/releases/download/v0.8.0/arrowhead-0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "6a5dbc0e372ccd65ffe5aaa13f4851f91a3a5a894e87f735ad2af822526e8fa4"
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
