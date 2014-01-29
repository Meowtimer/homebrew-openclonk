require "formula"

# Documentation: https://github.com/Homebrew/homebrew/wiki/Formula-Cookbook
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Openclonk < Formula
  head 'https://github.com/openclonk/openclonk/archive/master.zip', :using => :git
  version "4.0"

  depends_on "cmake" => :build
  depends_on "jpeg"
  depends_on "libpng"
  depends_on "freetype"
  depends_on "glew"
  depends_on "libogg"
  depends_on "libvorbis"

  def install
    system "cmake", ".", *std_cmake_args
    system "make"
    system "make install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test openclonk`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "true"
  end
end
