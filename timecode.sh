#!/bin/bash
FILES=*
for f in $FILES
do
  f=${f::-4}
  echo "Processing $f file..."
  # take action on each file. $f store current file name
  mkvmerge -o "./fixed/$f.mkv"  --default-duration 0:23.976fps --fix-bitstream-timing-information 0 $f.mkv
  echo "$f"
done
