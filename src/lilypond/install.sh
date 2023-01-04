#!/bin/sh
set -e

LILYPOND_VERSION=${VERSION:-2.24.0}
LILYPOND_PACKAGE=lilypond-${LILYPOND_VERSION}-linux-x86_64.tar.gz
LILYPOND_SHA256=5ed6ced6ade894b6dc1db35474b5e82a175a1149d34f16e75aaa9d885d9d3f6a

# Taken from https://github.com/devcontainers/features/blob/main/src/go/install.sh
apt_get_update()
{
    if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]
    then
        echo "Running apt-get update..."
        apt-get update -y
    fi
}

# Checks if packages are installed and installs them if not
check_packages() {
    if ! dpkg -s "${@}" > /dev/null 2>&1
    then
        apt_get_update
        apt-get -y install --no-install-recommends "${@}"
    fi
}

check_packages curl ca-certificates bzip2 unzip

echo "Downloading EB Garamond font..."
curl -L https://github.com/octaviopardo/EBGaramond12/archive/refs/heads/master.zip -o ebgaramond.zip

echo "Installing EB Garamond font to /usr/local/share/fonts..."
unzip ebgaramond.zip
install -Dm644 EBGaramond12-master/fonts/otf/*.otf -t /usr/local/share/fonts/opentype/EBGaramond12

echo "Downloading LilyPond version, version ${LILYPOND_VERSION}..."
curl -LO https://gitlab.com/lilypond/lilypond/-/releases/v${LILYPOND_VERSION}/downloads/${LILYPOND_PACKAGE}

if [ $(sha256sum ${LILYPOND_PACKAGE} | cut -d' ' -f1) != ${LILYPOND_SHA256} ]
then
   "LilyPond package SHA-256 checksum failed."
   exit 1
fi

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