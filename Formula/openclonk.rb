require "formula"

class Openclonk < Formula
	head 'https://github.com/openclonk/openclonk', :using => :git
	url 'https://github.com/openclonk/openclonk/archive/v6.0.zip'
	homepage 'http://www.openclonk.org'
	sha1 '358c8e312867c6d838cb96f2477b6c658d3f43d6'
	version "6.0"

	depends_on "cmake" => :build
	depends_on "jpeg"
	depends_on "libpng"
	depends_on "freetype"
	depends_on "glew"
	depends_on "libogg"
	depends_on "libvorbis"
	depends_on "boost"
	depends_on "freealut"

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
