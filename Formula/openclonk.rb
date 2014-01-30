require "formula"

class Openclonk < Formula
	head 'http://git.openclonk.org/openclonk.git', :using => :git
	url 'https://github.com/openclonk/openclonk/archive/4299faefd4b9acd04b3b781d1831ee7d46d7923d.zip'
	homepage 'http://www.openclonk.org'
	sha1 '51165fe6270df9d24303deedebd46445bab5e626'
	version "4.0+4299faefd4b9acd04b3b781d1831ee7d46d7923d"

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
