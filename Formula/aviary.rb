class Aviary < Formula
  desc "Ratatui cockpit for repo-resident Claude Code agents"
  homepage "https://github.com/JaydenGarrick/aviary"
  url "https://github.com/JaydenGarrick/aviary/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "a65ae9ee536d3b0fcc7e363b0b565d41036b94990b72500b3995a54b4d4fc62f"
  license "MIT"
  head "https://github.com/JaydenGarrick/aviary.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  def caveats
    <<~EOS
      aviary drives Claude Code (>= 2.1.224). Install it first:
        npm install -g @anthropic-ai/claude-code
      then run `aviary doctor` to check the environment.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aviary --version")
  end
end
