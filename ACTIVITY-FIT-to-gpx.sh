#!/usr/bin/env bash

GPSBABEL=`which gpsbabel` && echo "Got gpsbabel continuing…" || exit 1

cd ACTIVITY

for FIT_File in `ls *.FIT`; do
  if [ -a ${FIT_File}.gpx ]; then
    echo "${FIT_File} already converted to gpx"
  else
    echo "Converting ${FIT_File}"
    ${GPSBABEL} -i garmin_fit -f ${FIT_File} -o gpx -F ${FIT_File}.gpx
    git add ${FIT_File}.gpx
    git add ${FIT_File}
  fi
done

cd ..