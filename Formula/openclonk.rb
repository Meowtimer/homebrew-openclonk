require "formula"

class Openclonk < Formula
	head 'http://git.openclonk.org/openclonk.git', :using => :git
	url 'https://github.com/openclonk/openclonk/archive/acceeb72913bc60547747b74021778cac1891bce.zip'
	homepage 'http://www.openclonk.org'
	sha1 '64886d311f5844c385cf1c99c7e91e185a99025b'
	version "4.0+acceeb72913bc60547747b74021778cac1891bce"

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
