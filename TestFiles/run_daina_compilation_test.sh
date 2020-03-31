#!/bin/sh
daina -output DainaCompiler_Build/Daina -compile $(find $(pwd)/DainaCompiler -type f -not -path '*/\.*' |grep '.dai$')
