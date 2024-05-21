#!/bin/bash

# 计时开始
start=`date +%s`
# -z判断非空 空是true 非空false
if [ -z $1 ]; then
	echo "copy all data to data"
	mkdir -p data
	cd data
else
	if [ ! -d $1 ]; then
		echo "$1 is not a valid directory"
		exit 0
	fi
	echo "copy all data to $1"
	cd $1
fi

# download data
echo "Downloading MSCOCO2014 trian images ..."
curl -LO http://images.cocodataset.org/zips/train2017.zip
echo "Downloading MSCOCO2014 val image"
curl -LO http://images.cocodataset.org/zips/val2017.zip
echo "Downloading MSCOCO2014 test image"
curl -LO http://images.cocodataset.org/zips/test2017.zip

# unzip data
echo "Extracting train images ..."
mkdir train
unzip train2017.zip -d train
echo "Extracting val images ..."
mkdir val
unzip val2017.zip -d val
echo "Extracting test images ..."
mkdir test
unzip test2017.zip -d test

#remove zip file
echo "Removing zip files ..."
rm train2017.zip
rm val2017.zip
rm test2017.zip

end=`date +%s`
runtime=$((end-start))
echo "Completed in $runtime seconds"

