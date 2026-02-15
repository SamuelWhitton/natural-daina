#!/bin/sh
originalDir=$(pwd);
cd ./DainaCompiler/NonBootstrapped/
./compile.sh;
cd $originalDir;
mkdir -p ./DainaCompiler_Build/Binary/NonBootstrapped/
mv ./DainaCompiler/NonBootstrapped/daina ./DainaCompiler_Build/Binary/NonBootstrapped/daina
