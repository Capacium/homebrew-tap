class Capacium < Formula
  include Language::Python::Virtualenv

  desc "Capability Packaging System — package, distribute, and manage AI agent capabilities"
  homepage "https://github.com/Capacium/capacium"
  url "https://github.com/Capacium/capacium/archive/refs/tags/v1.1.6.tar.gz"
  sha256 "099ecb6a68b54700ecd8bc3d4ff8fdef3ff33eb149cff64884f010c6879c3104"
  license "Apache-2.0"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/cap", "--version"
  end
end
