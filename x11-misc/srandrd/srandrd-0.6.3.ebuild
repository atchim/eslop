# Copyright 2025-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Daemon that executes commands on display output changes"
HOMEPAGE="https://github.com/jceb/srandrd"
SRC_URI="https://github.com/jceb/srandrd/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	x11-libs/libX11
	x11-libs/libXrandr
	x11-libs/libXinerama
"
DEPEND="${RDEPEND}"

src_prepare() {
	default
	sed -i \
		-e 's/^CFLAGS\s*:=/CFLAGS +=/' \
		-e 's/^LDFLAGS\s*:=/LDFLAGS +=/' \
		Makefile || die
}

src_install() {
	emake \
		DESTDIR="${D}" \
		PREFIX="${EPREFIX}/usr" \
		install
}
