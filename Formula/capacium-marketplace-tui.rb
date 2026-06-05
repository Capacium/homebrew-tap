class CapaciumMarketplaceTui < Formula
  desc "Terminal UI marketplace for Capacium capability discovery and installation"
  homepage "https://capacium.xyz"
  url "https://github.com/Capacium/capacium-marketplace-tui/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "8e90894ec5f81628f24982836cce0d232d5c6a82f8cc41cb22f01032643a106d"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    system "npm", "run", "bundle:prod", "--if-present"
    libexec.install Dir["dist/ncc/*"]
    (bin/"capacium-marketplace-tui").write <<~SHELL
      #!/bin/bash
      exec node "#{libexec}/index.js" "$@"
    SHELL
  end

  test do
    assert_match "capacium-marketplace-tui", shell_output("#{bin}/capacium-marketplace-tui --version 2>&1 || true")
  end
end
