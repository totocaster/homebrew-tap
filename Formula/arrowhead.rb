class Arrowhead < Formula
  desc "Fast Obsidian search and discovery CLI"
  homepage "https://github.com/totocaster/arrowhead"
  version "0.4.0"
  license any_of: ["Apache-2.0", "MIT"]

  on_macos do
    on_arm do
      url "https://github.com/totocaster/arrowhead/releases/download/v0.4.0/arrowhead-0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "b07bd05c7df537fa9196e661d1117fb0090825cc0abfc274a8615a84ab786a3d"
    end

    on_intel do
      url "https://github.com/totocaster/arrowhead/releases/download/v0.4.0/arrowhead-0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "3a895594fd487ad87c72d408805e7ed33912531a49df8e33286e0b054a18b0e2"
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
