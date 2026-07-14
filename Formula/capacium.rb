class Capacium < Formula
  include Language::Python::Virtualenv

  desc "Capability Packaging System — package, distribute, and manage AI agent capabilities"
  homepage "https://github.com/Capacium/capacium"
  url "https://github.com/Capacium/capacium/archive/refs/tags/v0.15.0.tar.gz"
  sha256 "1fa15707509eb659d5eac13dc282a60962fd460a51b7ec05a3e63762b893f807"
  license "Apache-2.0"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/cap", "--version"
  end
end
