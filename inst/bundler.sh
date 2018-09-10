#!/bin/bash

rm precept2.zip
rm precept3.zip
rm precept4.zip
rm precept5.zip
rm precept6.zip
rm precept7.zip
rm precept8.zip
rm precept9.zip

zip -r --exclude=*.DS_Store* precept1.zip precept1
zip -r --exclude=*.DS_Store* precept2.zip precept2
zip -r --exclude=*.DS_Store* precept3.zip precept3
zip -r --exclude=*.DS_Store* precept4.zip precept4
zip -r --exclude=*.DS_Store* precept5.zip precept5
zip -r --exclude=*.DS_Store* precept6.zip precept6
zip -r --exclude=*.DS_Store* precept7.zip precept7
zip -r --exclude=*.DS_Store* precept8.zip precept8
zip -r --exclude=*.DS_Store* precept9.zip precept9

