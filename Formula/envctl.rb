class Envctl < Formula
  desc "Universal environment variable manager for macOS and Linux GUI and CLI apps"
  homepage "https://github.com/Capacium/envctl"
  url "https://github.com/Capacium/envctl/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "c3ea81a337626ad1c141d33e503a760ecd0665f38c4d08a973b6cb26d39801af"
  license "Apache-2.0"
  head "https://github.com/Capacium/envctl.git", branch: "main"

  def install
    bin.install "bin/envctl"
  end

  def caveats
    <<~EOS
      To complete setup, run:
        envctl install

      This installs the LaunchAgent (macOS) or environment.d service (Linux)
      that makes your env vars available to all GUI apps at login.

      Add vars to a cluster:
        envctl set ai V0_API_KEY=your-key

      Then reload:
        envctl reload
    EOS
  end

  test do
    assert_match "envctl", shell_output("#{bin}/envctl version")
  end
end
