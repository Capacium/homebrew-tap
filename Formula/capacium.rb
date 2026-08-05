class Capacium < Formula
  include Language::Python::Virtualenv

  desc "Capability Packaging System — package, distribute, and manage AI agent capabilities"
  homepage "https://github.com/Capacium/capacium"
  url "https://github.com/Capacium/capacium/archive/refs/tags/v0.17.0.tar.gz"
  sha256 "7b781da8f992376aa772e5ef61131dd1d4d39e059950c2fc1d676db5813d51aa"
  license "Apache-2.0"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/cap", "--version"
  end
end
