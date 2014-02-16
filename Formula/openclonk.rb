require "formula"

class Openclonk < Formula
	head 'https://github.com/Meowtimer/openclonk.git', :using => :git
	url 'https://github.com/Meowtimer/openclonk/archive/92186db246cd0fff7d5b4a40d07560bc2814bc4c.zip'
	homepage 'http://www.openclonk.org'
	sha1 '57af96ba4d8c0ea9ee601db18a7ab02ebe95c6db'
	version "4.0+92186db246cd0fff7d5b4a40d07560bc2814bc4c"

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
