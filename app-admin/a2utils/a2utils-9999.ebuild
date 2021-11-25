# Copyright 2001-2021 Joe Andrew
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Debian-style Apache Server Administration tools"
HOMEPAGE="https://github.com/JoeAndrew/a2utils"

inherit git-r3
EGIT_REPO_URI="https://github.com/joeandrew/${PN}.git"
KEYWORDS=""

LICENSE="MIT"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}
    www-servers/apache
    app-shells/bash"

src_install() {
        insinto /usr/sbin
        cp -R a2* "${D}/usr/sbin/" || die "A telepítés nem sikerült!"
}

pkg_postinst() {
        chmod +x /usr/sbin/a2*
        mkdir -p /etc/apache2/sites-{available,enabled}
}
