#!/bin/sh
originalDir=$(pwd)
codeVersion=VersionC
buildStage=2
cd ./DainaCompiler/$(echo $codeVersion);
./../../DainaCompiler_Build/Binary/Stage$(( buildStage - 1 ))/daina < daina_compilation_script.dai-compilation
cd $originalDir
mkdir -p ./DainaCompiler_Build/CompiledSource/Stage$(echo $buildStage)
mkdir -p ./DainaCompiler_Build/Binary/Stage$(echo $buildStage)
mv ./DainaCompiler/$(echo $codeVersion)/daina.d ./DainaCompiler_Build/CompiledSource/Stage$(echo $buildStage)/daina.d
ldc2 ./DainaCompiler_Build/CompiledSource/Stage$(echo $buildStage)/daina.d -O -of=./DainaCompiler_Build/Binary/Stage$(echo $buildStage)/daina

