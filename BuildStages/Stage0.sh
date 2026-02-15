#!/bin/sh
./DainaCompiler_Build/Binary/NonBootstrapped/daina ./DainaCompiler_Build/CompiledSource/Stage0/daina.c $(find ./DainaCompiler/VersionA -type f -not -path '*/\.*' |grep '.dai$')
mkdir -p ./DainaCompiler_Build/Binary/Stage0
mkdir -p ./DainaCompiler_Build/CompiledSource/Stage0
gcc -pthread -Wno-deprecated-declarations -o ./DainaCompiler_Build/Binary/Stage0/daina ./DainaCompiler_Build/CompiledSource/Stage0/daina.c