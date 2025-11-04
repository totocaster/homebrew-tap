class Arrowhead < Formula
  desc "Fast Obsidian search and discovery CLI"
  homepage "https://github.com/totocaster/arrowhead"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/totocaster/arrowhead/releases/download/v0.6.0/arrowhead-0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "97ee9e10358bc3e1969e9c250c6b4c2f61eb9364d46ff4eef7ef13b5d243da32"
    end

    on_intel do
      url "https://github.com/totocaster/arrowhead/releases/download/v0.6.0/arrowhead-0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "ab30f2c98b641975c39e407a1264bc6792726553c25766e9a8a346fd84c7b487"
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
