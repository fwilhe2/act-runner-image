#!/bin/bash

for variant in clang gcc java-tools rust; do
    sed 's|#%%TOOL_SCRIPTS%%|\&\& bash installers/'$variant'.sh \\|g' Dockerfile > Dockerfile.$variant
done

mv Dockerfile.java-tools Dockerfile.jvm