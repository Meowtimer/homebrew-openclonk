require "formula"

class Openclonk < Formula
	head 'https://github.com/Meowtimer/openclonk', :using => :git
	url 'https://github.com/Meowtimer/openclonk/archive/fd8b81c33e094b4c71f3b351f5a46026a77846e2.zip'
	homepage 'http://www.openclonk.org'
	sha1 '4f25c00fc74c9ae542b7b645c36c5f68c0477ac7'
	version "5.4.1"

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
