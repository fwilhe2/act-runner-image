#!/bin/bash
set -x

declare -A toolScripts
toolScripts[clang]=clang
toolScripts[gcc]=gcc
toolScripts[jvm]=java-tools
toolScripts[rust]=rust

for variant in clang gcc java-tools rust; do
    sed 's|#%%TOOL_SCRIPTS%%|\&\& bash installers/'$variant'.sh \\|g' Dockerfile > Dockerfile.$variant
done

mv Dockerfile.java-tools Dockerfile.jvm