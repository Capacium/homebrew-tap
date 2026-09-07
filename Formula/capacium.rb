class Capacium < Formula
  include Language::Python::Virtualenv

  desc "Capability Packaging System — package, distribute, and manage AI agent capabilities"
  homepage "https://github.com/Capacium/capacium"
  url "https://github.com/Capacium/capacium/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "2d23f3298f515754de0ddc9902e4f40adc970b2528b549eaaf9d9983baeb31b1"
  license "Apache-2.0"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/cap", "--version"
  end
end
