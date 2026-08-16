class Bup < Formula
  desc "Backup tool (airgap)"
  homepage "https://bup.github.io/"
  url "https://github.com/ikuo/bup/archive/refs/heads/airgap.tar.gz"
  license all_of: ["BSD-2-Clause", "LGPL-2.0-only"]
  version "0.33.10-0"

  depends_on "pandoc" => :build
  depends_on "pkgconf" => :build
  depends_on "python@3.14"
  depends_on "readline"

  def python3
    which("python3.14")
  end

  def install
    ENV["BUP_PYTHON_CONFIG"] = "#{python3}-config"
    system "make", "PREFIX=#{prefix}", "install"
  end

  test do
    system bin/"bup", "init"
    assert_path_exists testpath/".bup"
  end
end
