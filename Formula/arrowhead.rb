class Arrowhead < Formula
  desc "Fast Obsidian search and discovery CLI and daemon"
  homepage "https://github.com/totocaster/arrowhead"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/totocaster/arrowhead/releases/download/v0.7.0/arrowhead-0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "53ff1378c94e0568d4935cb45df26b5531bbb037b5ee531e025edd4d241672b5"
    end

    on_intel do
      url "https://github.com/totocaster/arrowhead/releases/download/v0.7.0/arrowhead-0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "534567c8af3b93a0559ae8211e4401fbfd384b32e170f1c86da950935a9bb649"
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
