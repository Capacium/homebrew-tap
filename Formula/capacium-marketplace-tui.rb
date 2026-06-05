class CapaciumMarketplaceTui < Formula
  desc "Terminal UI marketplace for Capacium capability discovery and installation"
  homepage "https://capacium.xyz"
  url "https://github.com/Capacium/capacium-marketplace-tui/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "8e90894ec5f81628f24982836cce0d232d5c6a82f8cc41cb22f01032643a106d"
  license "MIT"

  depends_on "node"

  def install
    libexec.install Dir["dist/ncc/*"]
    (bin/"capacium-marketplace-tui").write <<~SHELL
      #!/bin/bash
      exec node "#{libexec}/index.js" "$@"
    SHELL
  end

  test do
    assert_match "capacium", shell_output("node -e \"process.exit(0)\"")
  end
end
