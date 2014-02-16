require "formula"

class Openclonk < Formula
	head 'https://github.com/Meowtimer/openclonk.git', :using => :git
	url 'https://github.com/Meowtimer/openclonk/archive/61cd4271c92d5c807d119b26f02015b42ed3593e.zip'
	homepage 'http://www.openclonk.org'
	sha1 '41b206660c8d49abd277b9d1db9ac0c0db4fa339'
	version "4.0+61cd4271c92d5c807d119b26f02015b42ed3593e"

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
