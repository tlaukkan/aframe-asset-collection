#!/bin/bash
for filename in *.fbx; do
    fbx2gltf $filename
    name="${filename%.*}"
    gltfname="$name"_out/"$name".gltf
    perl -pi -w -e 's/HumanArmature\|Man_//g;' $gltfname
    gltf-import-export $gltfname
    glbname="$name"_out/"$name".glb
    mv $glbname .
    rm -Rf "$name"_out
done