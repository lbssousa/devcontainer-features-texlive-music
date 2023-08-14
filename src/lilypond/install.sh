#!/bin/sh
set -e

LILYPOND_VERSION=${VERSION:-2.24.1}
LILYPOND_PACKAGE=lilypond-${LILYPOND_VERSION}-linux-x86_64.tar.gz

install_debian_packages() {
    echo "Running apt-get update..."
    apt-get update -y

    echo "Installing packages: ${@}"
    apt-get -y install --no-install-recommends "${@}"
}

install_alpine_packages() {
    apk update
    apk add --no-cache "${@}"
}

install_alpine_community_packages() {
    apk add --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/v$(cut -d'.' -f1,2 /etc/alpine-release)/community "${@}"
}

install_alpine_testing_packages() {
    apk add --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/edge/testing "${@}"
}

# Bring in ID, ID_LIKE, VERSION_ID, VERSION_CODENAME
. /etc/os-release
# Get an adjusted ID independant of distro variants
if [ "${ID}" = "debian" ] || [ "${ID_LIKE}" = "debian" ]
then
    ADJUSTED_ID="debian"
elif [[ "${ID}" = "rhel" || "${ID}" = "fedora" || "${ID}" = "mariner" || "${ID_LIKE}" = *"rhel"* || "${ID_LIKE}" = *"fedora"* || "${ID_LIKE}" = *"mariner"* ]]
then
    ADJUSTED_ID="rhel"
elif [ "${ID}" = "alpine" ]
then
    ADJUSTED_ID="alpine"
else
    echo "Linux distro ${ID} not supported."
    exit 1
fi

case "${ADJUSTED_ID}" in
debian)
    install_debian_packages ca-certificates libfile-homedir-perl libunicode-linebreak-perl libyaml-tiny-perl perl-doc wget
    ;;
alpine)
    install_alpine_packages ca-certificates lilypond
    ;;
rhel)
    echo "RPM-based Linux distros not yet supported."
    exit 1
esac

check_packages curl ca-certificates bzip2 unzip ghostscript

echo "Downloading EB Garamond font..."
curl -L https://github.com/octaviopardo/EBGaramond12/archive/refs/heads/master.zip -o ebgaramond.zip

echo "Installing EB Garamond font to /usr/local/share/fonts..."
unzip ebgaramond.zip
install -Dm644 EBGaramond12-master/fonts/otf/*.otf -t /usr/local/share/fonts/opentype/EBGaramond12

echo "Downloading LilyPond version, version ${LILYPOND_VERSION}..."
curl -LO https://gitlab.com/lilypond/lilypond/-/releases/v${LILYPOND_VERSION}/downloads/${LILYPOND_PACKAGE}

echo "Installing ${LILYPOND_PACKAGE}..."
tar xzvf ${LILYPOND_PACKAGE} -C /opt

for bin in /opt/lilypond-${LILYPOND_VERSION}/bin/*
do
    echo "Symlinking ${bin} to /usr/local/bin..."
    ln -s ${bin} /usr/local/bin
done


# Clean up
rm -rf ./${LILYPOND_PACKAGE} ./EBGaramond12-master ./ebgaramond.zip
apt-get clean

echo "Done!"