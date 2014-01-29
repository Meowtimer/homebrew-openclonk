require "formula"

class Openclonk < Formula
  head 'http://git.openclonk.org/openclonk.git', :using => :git
  url 'https://github.com/openclonk/openclonk/archive/master.zip'
  version "4.0+"

  depends_on "cmake" => :build
  depends_on "jpeg"
  depends_on "libpng"
  depends_on "freetype"
  depends_on "glew"
  depends_on "libogg"
  depends_on "libvorbis"
  depends_on "boost"

  def install
    system "cmake", ".", *std_cmake_args
    system "make"
    system "make install"
  end

  test do
    system "true"
  end
end
