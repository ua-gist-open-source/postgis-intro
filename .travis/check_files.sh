#!/bin/bash

ret=0
if [ ! -f required_files.txt ]; then
    echo "required_files.txt not found"
    exit 1
fi
for f in $(cat required_files.txt); do 
  filename=$(basename -- "$f")
  extension="${filename##*.}"
  extension_upper=$(printf '%s\n' "$extension" | awk '{ print toupper($0) }')
  filename="${filename%.*}"
  if [[ ! -r $filename.$extension ]] && [[ ! -r $filename.$extension_upper ]]; then 
     echo "file $f does not exist or is not readable"
     ret=1
  else
    echo "$f exists:"
    ls -al $f
  fi
done
exit $ret
