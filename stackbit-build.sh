#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e94c40d1766cc0012b3b814/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e94c40d1766cc0012b3b814
curl -s -X POST https://api.stackbit.com/project/5e94c40d1766cc0012b3b814/webhook/build/ssgbuild > /dev/null
jekyll build
curl -s -X POST https://api.stackbit.com/project/5e94c40d1766cc0012b3b814/webhook/build/publish > /dev/null
