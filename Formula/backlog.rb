class Backlog < Formula
  desc "Anki-style resurfacer for fleeting plaintext notes"
  homepage "https://github.com/totocaster/backlog"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/totocaster/backlog/releases/download/v0.1.0/backlog-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "e7c0d3fff7f9852390ff00b33d1f1c6a667952257455d5a95f3bee9985a1494c"
    end

    on_intel do
      url "https://github.com/totocaster/backlog/releases/download/v0.1.0/backlog-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "4a7b07a6890b063621406fcb58ac25473749bb336301546b31dd2a92278fc728"
    end
  end

  def install
    bin.install "bin/backlog"
  end

  test do
    output = shell_output("\#{bin}/backlog --help")
    assert_match "backlog", output
  end
end
