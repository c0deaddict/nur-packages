#!/usr/bin/env nix-shell
#! nix-shell -i bash -p nodePackages.node2nix nodejs-14_x curl jq
set -eux -o pipefail

TARGET_VERSION=$(curl https://api.github.com/repos/Koenkk/zigbee2mqtt/releases/latest | jq -r ".tag_name")
ZIGBEE2MQTT=https://github.com/Koenkk/zigbee2mqtt/raw/$TARGET_VERSION

curl -LO $ZIGBEE2MQTT/package.json
curl -LO $ZIGBEE2MQTT/npm-shrinkwrap.json

node2nix --nodejs-14 \
  -l npm-shrinkwrap.json \
  -c node.nix \
  --bypass-cache \
  --no-copy-node-env \
  --node-env '<nixpkgs/pkgs/development/node-packages/node-env.nix>'
rm package.json npm-shrinkwrap.json
