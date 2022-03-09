gmt set MAP_FRAME_WIDTH 2p
gmt set FONT_ANNOT_PRIMARY 8p,4
gmt set FORMAT_GEO_MAP ddd:mm:ssF
gmt set MAP_TICK_LENGTH_PRIMARY 1p


gmt begin vel png
    set R="96/107/20/30"

    gmt basemap -R%R% -JM8c -Baf -BWSne
    gmt grdcut @earth_relief_30s.grd -R%R% -Gdem.grd
    gmt grdimage dem.grd -Cdem2 -I+d

    @REM 绘制 GPS 速度矢量
    @REM -Se 后面三参数表示：速度值为1的矢量的长度/置信度0.95/文本的大小
    @REM -W 控制矢量以及误差椭圆的轮廓的宽度，颜色，线型
    @REM -G 矢量填充色
    @REM -A 控制矢量的属性，0.15c 是矢量头的大小，+e 表示在矢量尾端绘制箭头，+p0.75p 矢量线段部分的宽度
    gmt plot YunNan_faults.txt -W0.6p,black
    gawk "{print $1,$2,$3,$4,0,0,0}" GPS.txt | gmt velo -Se0.03c/0.95/0 -A0.2c+e+p0.75p -Gblue -W0.2p,blue

    @REM 绘制垂直空白
    echo G 0.3c | gmt legend -DjBR+w2.4c+o0c/0c -F+p0.3p+gazure1@25
    echo 104.2 20.35 20 0 0 0 0 | gmt velo -Se0.03c/0.95/0 -A0.15c+e+p0.75p -Gblue -W0.2p,blue
    echo 105.3 20.35 20 mm/yr | gmt text -F+f7p+jML
gmt end
del gmt.*,dem.grd