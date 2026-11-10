class Capacium < Formula
  include Language::Python::Virtualenv

  desc "Capability Packaging System — package, distribute, and manage AI agent capabilities"
  homepage "https://github.com/Capacium/capacium"
  url "https://github.com/Capacium/capacium/archive/refs/tags/v1.1.7.tar.gz"
  sha256 "406861d73ec0272b8c4962725a646018f53e54e286f7b10861f6d44383c2c681"
  license "Apache-2.0"

  depends_on "python@3.12"

  # virtualenv_install_with_resources installs without dependency resolution,
  # so every runtime dependency of capacium must be declared here. Without
  # PyYAML, cap cannot read capability.yaml and bundle installs fail.
  resource "capacium-models" do
    url "https://files.pythonhosted.org/packages/c5/4c/977d365ec36666d96105c634c0503fc47d756d6f724c1c7be686a3e89679/capacium_models-1.1.0.tar.gz"
    sha256 "ae48ff611a18e14aeec0edbad0d4c76ad0ad6194c767e1e0f095bd41174b6e39"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/05/8e/961c0007c59b8dd7729d542c61a4d537767a59645b82a0b521206e1e25c2/pyyaml-6.0.3.tar.gz"
    sha256 "d76623373421df22fb4cf8817020cbb7ef15c725b9d5e45f17e189bfc384190f"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/cap", "--version"
    system libexec/"bin/python", "-c", "import yaml"
  end
end
