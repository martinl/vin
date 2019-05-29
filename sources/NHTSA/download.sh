# download NHTSA vehicle manufacturer VIN decoding guides
# create index_mfr.txt files with search and copy-paste from 0_index_mfrs_partial.pdf
# newer documents (2014-2015) are named ORG10xxx.pdf, not included in index pdf file

#mfrs="chrysler honda kia fiat hyundai subaru gm jeep toyota"
mfrs=`ls _index/index_* | cut -d _ -f 3-4 | cut -d . -f 1`

for m in $mfrs; do
 mkdir -p $m
 echo $m
 cd $m
  for i in `cat ../index_$m.txt`; do 
    file="$i.pdf"
    if [ ! -f $file ]; then
      wget ftp://ftp.nhtsa.dot.gov/mfrmail/$file
    else 
      echo "$file already exists, skipping download"
    fi
  done
 cd ..
done
