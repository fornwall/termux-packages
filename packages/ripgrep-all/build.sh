TERMUX_PKG_HOMEPAGE=https://github.com/phiresky/ripgrep-all
TERMUX_PKG_DESCRIPTION="Search tool able to locate in PDFs, E-Books, zip, tar.gz, etc"
TERMUX_PKG_LICENSE="AGPL-V3"
TERMUX_PKG_MAINTAINER="Krishna Kanhaiya @kcubeterm"
TERMUX_PKG_VERSION="0.10.6"
TERMUX_PKG_DEPENDS="ripgrep, fzf"
TERMUX_PKG_RECOMMENDS="ffmpeg, poppler, sqlite"
TERMUX_PKG_SRCURL=https://github.com/phiresky/ripgrep-all/archive/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=06cd619ad6638be206266a77fdf11034dc2dc15d97b3a057b0d6280a17334680
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make() {
	termux_setup_rust

	RUSTFLAGS+=" -C link-arg=$($CC -print-libgcc-file-name)"

	cargo build --jobs $TERMUX_PKG_MAKE_PROCESSES --target $CARGO_TARGET_NAME --release
}

termux_step_make_install() {
	install -Dm755 -t $TERMUX_PREFIX/bin target/${CARGO_TARGET_NAME}/release/rga
	install -Dm755 -t $TERMUX_PREFIX/bin target/${CARGO_TARGET_NAME}/release/rga-preproc
	install -m755 $TERMUX_PKG_BUILDER_DIR/rga-fzf  $TERMUX_PREFIX/bin/rga-fzf
}
