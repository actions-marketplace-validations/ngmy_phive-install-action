#/bin/bash
set -Ceuo pipefail

if [ "${1+defined}" = defined ]; then KEYSERVER=$1; else KEYSERVER=hkps://keyserver.ubuntu.com; fi

wget -O phive.phar https://phar.io/releases/phive.phar
wget -O phive.phar.asc https://phar.io/releases/phive.phar.asc
gpg --keyserver ${KEYSERVER} --recv-keys 0x9D8A98B29B2D5D79
gpg --verify phive.phar.asc phive.phar
chmod +x phive.phar
