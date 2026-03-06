class Withingy < Formula
  desc "Unofficial Withings data CLI written in Go"
  homepage "https://github.com/totocaster/withingy"
  license "MIT"
  head "https://github.com/totocaster/withingy.git", branch: "main"

  depends_on "go" => :build

  def install
    build_time = Time.now.utc.strftime("%Y-%m-%dT%H:%M:%SZ")
    ldflags = %W[
      -s
      -w
      -X main.version=HEAD
      -X main.commit=homebrew
      -X main.date=#{build_time}
    ]

    system "go", "build", *std_go_args(output: bin/"withingy", ldflags:), "./cmd/withingy"
  end

  test do
    assert_match "withingy", shell_output("#{bin}/withingy --version")
    assert_match "activity", shell_output("#{bin}/withingy --help")
  end
end
