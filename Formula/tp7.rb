class Tp7 < Formula
  desc "Command-line file access for Teenage Engineering TP-7 field recorders"
  homepage "https://github.com/totocaster/tp7"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/totocaster/tp7/releases/download/v0.1.0/tp7-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "b240dd2fcf0d36af6f07dcf5c94c84e5c687dfd50226ec9c8ecb3d00eafd92d7"
    end

    on_intel do
      url "https://github.com/totocaster/tp7/releases/download/v0.1.0/tp7-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "248904c86eb7720c88e174fb41d5c0f28a36e2f4fb2e74d19836858f88f66440"
    end
  end

  def install
    bin.install "bin/tp7"
  end

  test do
    version_output = shell_output("#{bin}/tp7 --version")
    assert_match "tp7 #{version}", version_output

    help_output = shell_output("#{bin}/tp7 --help")
    assert_match "Teenage Engineering TP-7 file access CLI", help_output
  end
end
