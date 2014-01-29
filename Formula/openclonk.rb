require "formula"

class Openclonk < Formula
  head 'http://git.openclonk.org/openclonk.git', :using => :git
  url 'https://github.com/openclonk/openclonk/archive/f1cc91055a7dfa6004021cfe6b721c9a15aa11a3.zip'
  homepage 'http://www.openclonk.org'
  sha1 'c7e647147029d6ba9ad271e1a40aebbc54cf25a6'
  version "4.0+f1cc91055a7dfa6004021cfe6b721c9a15aa11a3"

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
