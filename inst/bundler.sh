#!/bin/bash

rm extdata/precept2.zip
rm extdata/precept3.zip
rm extdata/precept4.zip
rm extdata/precept5.zip
rm extdata/precept6.zip
rm extdata/precept7.zip
rm extdata/precept8.zip
rm extdata/precept9.zip

zip -r --exclude=*.DS_Store* extdata/precept1.zip precept1
zip -r --exclude=*.DS_Store* extdata/precept2.zip precept2
zip -r --exclude=*.DS_Store* extdata/precept3.zip precept3
zip -r --exclude=*.DS_Store* extdata/precept4.zip precept4
zip -r --exclude=*.DS_Store* extdata/precept5.zip precept5
zip -r --exclude=*.DS_Store* extdata/precept6.zip precept6
zip -r --exclude=*.DS_Store* extdata/precept7.zip precept7
zip -r --exclude=*.DS_Store* extdata/precept8.zip precept8
zip -r --exclude=*.DS_Store* extdata/precept9.zip precept9

