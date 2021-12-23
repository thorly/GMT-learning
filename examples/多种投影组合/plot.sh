gmt begin point png

    gmt coast -Rg -JE118.23447868611112/34.94976391666667/90/25c -A10000 -Glightgray -Wthinnest
    echo 118.23447868611112 34.94976391666667 6672 | gmt plot -SE- -W1p,black
    echo 118.23447868611112 34.94976391666667 13344 | gmt plot -SE- -W1p,black
    echo 118.23447868611112 34.94976391666667 | gmt plot -St1c -Gblack
    gmt plot point.txt -i1,0 -Sc0.3c -Gred
    gmt basemap -R0/360/0/90 -JPa25c -Bxa90g90 -Bya30
    gmt text << EOF
90 32 30
90 62 60
EOF

gmt end
