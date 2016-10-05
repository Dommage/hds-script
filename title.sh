#!/bin/bash
FILES=*
for f in $FILES
do
  f=${f::-4}
  echo "Processing $f file..."
  # take action on each file. $f store current file name
  mkvpropedit "$f.mkv" --edit info --set "title=$f"
  echo "$f"
done
