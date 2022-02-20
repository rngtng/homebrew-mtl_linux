# Documentation: https://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula

class MtlLinux < Formula
  desc "Homebrew Formular to easily install Nabaztag:Tag Bytecodes (MTL) compiler on Mac OSX"
  homepage "https://github.com/RedoXyde/mtl_linux"
  url "https://github.com/rngtng/mtl_linux/archive/v.0.0.1.tar.gz"
  sha256 "b2063d7db345765e0e0ee8cb73923e1e1f7e9487858808baec0989143d3aeb1e"

  def install
    # Temporaty workaround to enforce /usr/bin/gcc usage.
    # mtl_linux doesn't run when build with clang :(
    # if fixed use `system "make"` instead
    Kernel.system({"PATH" => "/usr/bin:#{`echo $PATH`.chomp}"}, "make")
    bin.install "mtl_compiler"
    bin.install "mtl_simu"
  end

  test do
  end
end
