require "formula"

class Openclonk < Formula
	head 'https://github.com/openclonk/openclonk', :using => :git
	url 'https://github.com/openclonk/openclonk/archive/1066c4a4b3fe50d98f63cf27c417ba17cf1aece6.zip'
	homepage 'http://www.openclonk.org'
	sha1 '68b6c5c4bf0177aa94647a1b5413287b599c9128'
	version "5.4.1"

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
