#!/bin/bash

#Removing extra=”true”
grep -rl 'extra="true"' . | xargs sed -i 's/extra="true"//g'

#ForceUppercase
grep -rl '<forceUppercase>0</forceUppercase>' . | xargs sed -i 's#<forceUppercase>0</forceUppercase>#<letterCase>none</letterCase>#g'
grep -rl '<forceUppercase>false</forceUppercase>' . | xargs sed -i 's#<forceUppercase>false</forceUppercase>#<letterCase>none</letterCase>#g'
grep -rl '<forceUppercase>true</forceUppercase>' . | xargs sed -i 's#<forceUppercase>true</forceUppercase>#<letterCase>uppercase</letterCase>#g'
grep -rl '<forceUppercase>1</forceUppercase>' . | xargs sed -i 's#<forceUppercase>1</forceUppercase>#<letterCase>uppercase</letterCase>#g'

#alignment
grep -rl 'alignment' . | xargs sed -i 's#alignment#horizontalAlignment#g'

#video
grep -rl '<showSnapshotNoVideo>true</showSnapshotNoVideo>' . | xargs sed -i '\#<showSnapshotNoVideo>true</showSnapshotNoVideo>#d'
grep -rl '<showSnapshotNoVideo>false</showSnapshotNoVideo>' . | xargs sed -i '\#<showSnapshotNoVideo>false</showSnapshotNoVideo>#d'
grep -rl '<showSnapshotDelay>false</showSnapshotDelay>' . | xargs sed -i '\#<showSnapshotDelay>false</showSnapshotDelay>#d'
grep -rl '<showSnapshotDelay>true</showSnapshotDelay>' . | xargs sed -i '\#<showSnapshotDelay>true</showSnapshotDelay>#d'

#FormatVersion & Unused Elements
grep -rl 'FormatVersion' . | xargs sed -i '\#FormatVersion#d'
grep -rl '<pos>1 1</pos>' . | xargs sed -i '\#<pos>1 1</pos>#d'

#Views and Variants
#grep -rl '/view' . | xargs sed -i 's#/view#/variant#g'

###append
grep -rl '/view' . | xargs sed -i '/<\/view>/a <\/variant>'
grep -rl '<image name="md' . | xargs sed -i '/<image name="md/a <imageType>image<\/imageType>'
grep -rl '<text name="md' . | xargs sed -i '/<text name="md/a <metadata>genre<\/metadata>'

###replace
grep -rl 'view name' . | xargs sed -i 's#view name#variant name#g'
grep -rl '<view' . | xargs sed -i 's#<view#<variant#g'

##
grep_files=$(grep -rl 'variant name' .)

for file in $grep_files; do
    sed -i '/<variant/a <view name="gamelist">' "$file"
    #sed -i '/<\/variant>/a <\/variant>' "$file"
    xmllint --format $file > tmp.xml && mv tmp.xml $file
done


