cd $1
wget https://distfiles.gentoo.org/releases/amd64/autobuilds/current-stage3-amd64-desktop-openrc/$(grep -o "\"stage3-amd64-desktop-openrc-[0-9A-Z]*.tar.xz\"" <<< $(python3 -c 'import sys, urllib.parse; print(urllib.parse.unquote(sys.stdin.read()))' <<< $(wget --quiet --https-only --secure-protocol=PFS -O - -- https://distfiles.gentoo.org/releases/amd64/autobuilds/current-stage3-amd64-desktop-openrc)) | sort -u | head -1 | cut -d '"' -f 2)
tar xpf stage3-*.tar.xz --xattrs-include='*.*' --numeric-owner -C $1
rm stage3-*.tar.xz
