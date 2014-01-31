require "formula"

class Openclonk < Formula
	head 'https://github.com/Meowtimer/openclonk.git', :using => :git
	url 'https://github.com/Meowtimer/openclonk/archive/af753956cfebb8b338da42dd186837d6499416ce.zip'
	homepage 'http://www.openclonk.org'
	sha1 'cedde83774689815652160b37cadd0362ac6ae60'
	version "4.0+af753956cfebb8b338da42dd186837d6499416ce"

	depends_on "cmake" => :build
	depends_on "jpeg"
	depends_on "libpng"
	depends_on "freetype"
	depends_on "glew"
	depends_on "libogg"
	depends_on "libvorbis"
	depends_on "boost"

	def install
		args = std_cmake_args
		if Formula.factory('freetype').installed?
			args << "-DFREETYPE_INCLUDE_DIR_freetype2=#{HOMEBREW_PREFIX}/include/freetype2"
			args << "-DFREETYPE_INCLUDE_DIR_ft2build=#{HOMEBREW_PREFIX}/include/freetype2"
			args << "-DZLIB_LIBRARY=/usr/lib/libz.dylib"
		end
		system "cmake", ".", *args
		system "make"
		system "make install"
	end

	test do
		system "true"
	end
end
