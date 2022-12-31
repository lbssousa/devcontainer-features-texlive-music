#!/bin/sh
set -e

LILYPOND_VERSION=${VERSION:-2.24.0}
LILYPOND_PACKAGE=lilypond-${LILYPOND_VERSION}.linux-x86_64.tar.gz

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

check_packages curl ca-certificates bzip2

echo "Downloading LilyPond version, version ${LILYPOND_VERSION}..."
curl -O https://gitlab.com/lilypond/lilypond/-/releases/v${LILYPOND_VERSION}/downloads/${LILYPOND_PACKAGE}

echo "Installing LilyPond..."
tar xzvf ${LILYPOND_PACKAGE} -C /opt

for bin in /opt/lilypond-${LILYPOND_VERSION}/bin
do
    ln -s ${bin} /usr/local/bin
done


# Clean up
rm -f ./${LILYPOND_PACKAGE}
apt-get clean

echo "Done!"
