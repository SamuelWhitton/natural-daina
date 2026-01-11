#!/bin/sh
./DainaCompiler_Build/Daina < TestFiles/daina_compilation_script.dai-compilation
ldc2 TestFiles/output.d -O -of=TestFiles/output
#./TestFiles/output
./TestFiles/output < TestFiles/daina_compilation_script.dai-compilation
#daina -output DainaCompiler_Build/Daina -compile $(find $(pwd)/DainaCompiler -type f -not -path '*/\.*' |grep '.dai$')



