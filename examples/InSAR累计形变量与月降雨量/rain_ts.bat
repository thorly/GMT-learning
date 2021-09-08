gmt set FORMAT_DATE_MAP "yyyy-mm-dd"
gmt set FORMAT_TIME_PRIMARY_MAP Abbreviated
gmt set FORMAT_DATE_IN "yyyymmdd"
gmt set MAP_FRAME_PEN 0.5p
gmt set FONT_ANNOT_PRIMARY 10p,4
gmt set MAP_TICK_LENGTH_PRIMARY -3p
gmt set FONT_LABEL 10p,4
gmt set MAP_GRID_PEN_PRIMARY 0.1p,gray,-
gmt set MAP_LABEL_OFFSET 5p
gmt set MAP_ANNOT_OFFSET_PRIMARY 5.5p
gmt set MAP_ANNOT_ORTHO Z


gmt begin
    gmt figure rain_ts png A0.1c

    set R2="2016-12T/2021-2T/0/500"
    gmt basemap -R%R2% -JX10c/8c -Bxa12Of30d -Bya50f50+l"@%%39%%月降雨量 @%%4%%(mm)" -BE
    
    gmt plot qujian.txt -L -Glightblue

    gmt plot 2017-point-gmt.txt -W3p,0/139/0
    gmt plot 2018-point-gmt.txt -W3p,0/139/0
    gmt plot 2019-point-gmt.txt -W3p,0/139/0
    gmt plot 2020-point-gmt.txt -W3p,0/139/0

    set R1="2016-12T/2021-2T/-260/160"
    gmt basemap -R%R1% -JX10c/8c -Bxa12Of30d -Bya60f30+l"@%%39%%累计形变量 @%%4%%(mm)" -BWSn

    gmt plot C-asc.txt -Sc0.1c -Gblack
    gmt plot F-des.txt -Sc0.1c -Gred

    echo 20170202 135 a\) | gmt text -F+f10p+jBC -Dj0c/0c

    echo N 1 > legend.txt
    echo S 0.1i c 0.1c black - 0.22i C（升轨最大形变点） >> legend.txt
    echo G 0.1c >> legend.txt
    echo S 0.1i c 0.1c red - 0.22i F（降轨最大形变点） >> legend.txt
    echo G 0.1c >> legend.txt
    echo S 0.1i - 0.3c 0/139/0 3p,0/139/0 0.22i 月降雨量 >> legend.txt
    echo G 0.1c >> legend.txt
    echo S 0.1i - 0.3c lightblue 3p,lightblue 0.22i 加速运动 >> legend.txt
    gmt legend legend.txt -DjTL+w2.5c+o0.2c/0.6c  --FONT_ANNOT_PRIMARY=8p,39
gmt end
del gmt.*