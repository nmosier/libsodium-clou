#!/bin/bash

usage() {
    cat <<EOF
usage: $0 <builddir>
EOF
}

case $# in
    0)
	BUILD="$PWD"
	;;
    1)
	BUILD="$1"
	shift 1
	;;
    *)
	usage >&2
	exit 1
esac

cd "${BUILD}/src/libsodium/.libs"
if ! [[ -d objs ]]; then
    mkdir objs
fi

cd objs
ar -x ../libsodium.a
$(brew --prefix llvm@13)/bin/llvm-link *.o > ../libsodium.bc
cp ../libsodium.bc "$BUILD"

