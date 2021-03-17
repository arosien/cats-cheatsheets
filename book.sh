#!/bin/bash

IN=${IN:-$1.adoc}
OUT=target/asciidoctor
ROOT=/documents

CMD=asciidoctor
EXT=.html

OUT_NAME=${OUT_NAME:-$1}
OUT_FILE=$OUT_NAME$EXT

docker run -v $(pwd):$ROOT asciidoctor/docker-asciidoctor \
  $CMD \
  --destination-dir $ROOT/$OUT \
  --out-file $OUT_FILE \
  --require asciidoctor-diagram \
  --verbose \
  $IN

cp *.jpg $OUT