#!/bin/sh
./DainaCompiler_Build/Daina < TestFiles/daina_compilation_script.dai-compilation
dmd TestFiles/output.d -O -of=TestFiles/output
./TestFiles/output
#daina -output DainaCompiler_Build/Daina -compile $(find $(pwd)/DainaCompiler -type f -not -path '*/\.*' |grep '.dai$')



