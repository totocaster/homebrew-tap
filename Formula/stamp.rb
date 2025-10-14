class Stamp < Formula
  desc "A simple Go CLI tool for generating note filenames based on date/time"
  homepage "https://github.com/totocaster/stamp"
  version "0.1.1"
  license "MIT"

  # For macOS
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/totocaster/stamp/releases/download/v0.1.1/stamp_0.1.1_Darwin_arm64.tar.gz"
      sha256 "d6d0bb405d5143e8d316485eb13bbe6d36bb453d81e4d93b0646d9cf68773ee6"
    else
      url "https://github.com/totocaster/stamp/releases/download/v0.1.1/stamp_0.1.1_Darwin_x86_64.tar.gz"
      sha256 "fb98c97739aeb3a8ea0afa8e76acebce416857fda4c34b7f84e65874501f6e9f"
    end
  # For Linux
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/totocaster/stamp/releases/download/v0.1.1/stamp_0.1.1_Linux_arm64.tar.gz"
      sha256 "e87df11ee39648f6f3ef5293adc01213cadbc2dcb13f501fdabcb535bf5e9829"
    else
      url "https://github.com/totocaster/stamp/releases/download/v0.1.1/stamp_0.1.1_Linux_x86_64.tar.gz"
      sha256 "6c3bde5d4a3e99faadfba04e865489f83676bcb7db754c9e9cee6a34ec4b0c26"
    end
  end

  # Optional: Go is only needed if building from source
  depends_on "go" => :optional

  def install
    # Install the stamp binary
    bin.install "stamp"

    # Create the nid symlink
    bin.install_symlink "stamp" => "nid"
  end

  test do
    # Test that the binary runs and shows version
    assert_match /stamp version/, shell_output("#{bin}/stamp version")

    # Test daily note generation
    assert_match(/\d{4}-\d{2}-\d{2}/, shell_output("#{bin}/stamp daily"))

    # Test that nid symlink works
    assert_predicate bin/"nid", :exist?
    assert_match(/\d{4}-\d{2}-\d{2}/, shell_output("#{bin}/nid daily"))

    # Test fleeting note generation
    assert_match(/\d{4}-\d{2}-\d{2}-F\d{6}/, shell_output("#{bin}/stamp fleeting"))

    # Test project note generation (should start with P)
    assert_match(/^P\d{4}/, shell_output("#{bin}/stamp project"))
  end
end