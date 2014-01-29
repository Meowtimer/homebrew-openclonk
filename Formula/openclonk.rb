require "formula"

class Openclonk < Formula
	head 'http://git.openclonk.org/openclonk.git', :using => :git
	url 'https://github.com/openclonk/openclonk/archive/f1cc91055a7dfa6004021cfe6b721c9a15aa11a3.zip'
	homepage 'http://www.openclonk.org'
	sha1 '22025159684f1320c487f6f30937d33013e38b43'
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
