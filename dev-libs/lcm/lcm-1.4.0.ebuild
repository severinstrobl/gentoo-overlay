# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..11} )

inherit cmake python-single-r1

DESCRIPTION="Lightweight Communications and Marshalling"
HOMEPAGE="https://github.com/lcm-proj/lcm"
SRC_URI="https://github.com/lcm-proj/lcm/releases/download/v${PV}/${P}.zip -> ${P}.zip"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc java lua python"

RDEPEND="
	dev-libs/glib:2
	java? ( >=virtual/jdk-1.6:* )
	lua? ( >=dev-lang/lua-5.1:= )
	python? ( ${PYTHON_DEPS} )
"

DEPEND="${RDEPEND}
	doc? ( app-doc/doxygen )"

src_configure() {
	local mycmakeargs=(
		-DLCM_ENABLE_JAVA=$(usex java)
		-DLCM_ENABLE_LUA=$(usex lua)
		-DLCM_ENABLE_PYTHON=$(usex python)
	)

	cmake_src_configure
}

