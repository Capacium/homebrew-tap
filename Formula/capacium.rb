class Capacium < Formula
  include Language::Python::Virtualenv

  desc "Capability Packaging System — package, distribute, and manage AI agent capabilities"
  homepage "https://github.com/Capacium/capacium"
  url "https://github.com/Capacium/capacium/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "6bad5170414e8c3a40cb3293d7dbdb17c8e644cb07314780f1dd54aaef913958"
  license "Apache-2.0"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/cap", "--version"
  end
end
