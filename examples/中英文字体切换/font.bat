gmt set MAP_FRAME_TYPE plain
gmt set FONT_ANNOT_PRIMARY 12p,4
gmt set MAP_TICK_LENGTH 2p/1p
gmt set MAP_FRAME_PEN 1p

gmt begin font png
    gmt basemap -R1/10/1/10 -JX8c -Bxa2f1+l"@%%39%%����@%%4%%(km)" -Bya2f1+l"@%%39%%ʱ��@%%4%%(day)" -BWSne

    echo 2 2 @%%4%%test@%%39%%���� | gmt text
    echo 4 4 @%%34%%\254@%%39%%һ�� | gmt text

gmt end
del gmt.*