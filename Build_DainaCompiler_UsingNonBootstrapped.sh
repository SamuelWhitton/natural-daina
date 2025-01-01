#!/bin/sh
./NonBootstrappedDainaCompiler/daina DainaCompiler_Build/Daina $(find $(pwd)/DainaCompiler -type f -not -path '*/\.*' |grep '.dai$')
