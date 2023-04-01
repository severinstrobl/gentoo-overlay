# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit webapp

MY_PV=$(ver_rs 3 -)

DESCRIPTION="Simple, modern and fast web-based email client"
HOMEPAGE="https://snappymail.eu/"
SRC_URI="https://github.com/the-djmaze/snappymail/releases/download/v${MY_PV}/snappymail-${MY_PV}.zip"

LICENSE="AGPL-3"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="
	>=dev-lang/php-7.3[curl,iconv,json,ssl,xml]
	virtual/httpd-php"

S=${WORKDIR}

src_install() {
	webapp_src_preinst

	insinto "${MY_HTDOCSDIR}"
	doins -r .

	webapp_serverowned -R "${MY_HTDOCSDIR}"/data

	webapp_src_install
}
