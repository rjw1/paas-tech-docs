#!/bin/sh

set -euo pipefail

while IFS=, read -r col1 col2 col3 col4
do
    if [ -e $col1 ]; then
        sed -i -e '1,7d' $col1
    fi

    echo "---" >> $col1-meta
    echo "title: ${col2}" >> $col1-meta
    echo "id: ${col3}" >> $col1-meta
    echo "navigator: false" >> $col1-meta
    echo "order: ${col4}" >> $col1-meta
    echo "---" >> $col1-meta
    echo "" >> $col1-meta
    rm $col1-e
    cat $col1-meta > $col1-tmp
    rm $col1-meta
    cat $col1 >> $col1-tmp
    mv $col1-tmp $col1
done < layout.csv
