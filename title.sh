#!/bin/bash
FILES=*
for f in $FILES
do
  f=${f::-4}
  echo "Processing $f file..."
  # action
  mkvpropedit "$f.mkv" --edit info --set "title=$f"
  echo "$f"
done
