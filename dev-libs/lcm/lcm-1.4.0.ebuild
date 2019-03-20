# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{4,5,6} )

inherit cmake-utils python-single-r1

DESCRIPTION="Lightweight Communications and Marshalling"
HOMEPAGE="https://github.com/lcm-proj/lcm"
SRC_URI="https://github.com/lcm-proj/lcm/releases/download/v${PV}/${P}.zip -> ${P}.zip"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="java lua python"

RDEPEND="
	dev-libs/glib:2
	java? ( >=virtual/jdk-1.6:* )
	lua? ( >=dev-lang/lua-5.1:= )
	python? ( ${PYTHON_DEPS} )
"

src_configure() {
	local mycmakeargs=(
		-DLCM_ENABLE_JAVA=$(usex java)
		-DLCM_ENABLE_LUA=$(usex lua)
		-DLCM_ENABLE_PYTHON=$(usex python)
	)

	cmake-utils_src_configure
}
