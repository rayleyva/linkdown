#!/bin/sh

if [ "$1" == "watch" ]; then
    linkdown all -ws doc_src doc
elif [ "$1" == "zip" ]; then
    linkdown all doc_src doc
    mkdir -p dist/doc
    cat > dist/doc/index.html <<EOF
<html><head><meta http-equiv="Refresh" content="0;URL=./doc/index.html" /></head>
<body><a href="./doc/index.html">Go to document</a></body></html>
EOF
    cp -R doc_src dist/doc/doc_src
    cp -R doc dist/doc/doc
    (cd dist/doc; zip -r ../linkdown-doc.zip doc doc_src index.html;)
    rm -r dist/doc
else
    linkdown all doc_src doc
fi
