TERMUX_PKG_HOMEPAGE=https://www.imagemagick.org/
TERMUX_PKG_DESCRIPTION="Suite to create, edit, compose, or convert images in a variety of formats"
TERMUX_PKG_LICENSE="ImageMagick"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="7.1.1.34"
_VERSION="${TERMUX_PKG_VERSION%.*}-${TERMUX_PKG_VERSION##*.}"
#TERMUX_PKG_SRCURL=https://github.com/ImageMagick/ImageMagick/archive/refs/tags/${_VERSION}.tar.gz
TERMUX_PKG_SRCURL=https://imagemagick.org/archive/releases/ImageMagick-${_VERSION}.tar.xz
TERMUX_PKG_SHA256=abab52de4b8f0356c05ddee3d3398c147fd9f6c099760f2cb15f3b8168a776c7
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_DEPENDS="fftw, fontconfig, freetype, gdk-pixbuf, glib, harfbuzz, imath,libbz2, libc++, libcairo, libheif, libjpeg-turbo, libjxl, liblzma, libpng, librsvg, libtiff, libwebp, libxml2, littlecms, openexr, openjpeg, pango, zlib"
TERMUX_PKG_BREAKS="imagemagick-dev, imagemagick-x"
TERMUX_PKG_REPLACES="imagemagick-dev, imagemagick-x"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
--without-x
--without-gvc
--with-magick-plus-plus=yes
--with-bzlib=yes
--with-xml=yes
--with-rsvg=yes
--with-lzma
--with-jxl=yes
--with-openexr
--with-fftw
--disable-openmp
ac_cv_func_ftime=no
"

TERMUX_PKG_RM_AFTER_INSTALL="
share/ImageMagick-7/francais.xml
"

termux_step_pre_configure() {
	export LDFLAGS+=" $($CC -print-libgcc-file-name)"

	# Value of PKG_CONFIG becomes hardcoded in bin/*-config
	export PKG_CONFIG=pkg-config
}
