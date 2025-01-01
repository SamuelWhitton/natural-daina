#!/bin/sh
./NonBootstrappedDainaCompiler/daina DainaCompiler_Build/Daina.c $(find $(pwd)/DainaCompiler -type f -not -path '*/\.*' |grep '.dai$')
gcc -pthread -Wno-deprecated-declarations -o DainaCompiler_Build/Daina DainaCompiler_Build/Daina.c