gmt set MAP_FRAME_TYPE plain
gmt set FORMAT_GEO_MAP ddd:mm:ssF
gmt set FONT_ANNOT_PRIMARY 18p,4
gmt begin profile png A0.3c
    gmt basemap -R118.7/122/32.5/34.5 -JM30c -BWNse -Baf
    @REM 填充
    gmt coast  -S89/195/226 -Di -Ia -W1
    gmt basemap -R118.7/122/32.5/34.5 -JM30c -BWNse -Baf
    @REM 绘制事件
    gawk "{if ($17>0) print $3,$2,$17,$4}" t1 > loc.txt
    gawk "{if ($17>0 &&$17<=1) print $3,$2,$17,$4}" t1 > 0-1.txt
    gawk "{if ($17>1 &&$17<=2) print $3,$2,$17,$4}" t1 > 1-2.txt
    gawk "{if ($17>2 &&$17<=3) print $3,$2,$17,$4}" t1 > 2-3.txt
    gawk "{if ($17>3 &&$17<=4) print $3,$2,$17,$4}" t1 > 3-4.txt
    gawk "{if ($17>4 &&$17<=5) print $3,$2,$17,$4}" t1 > 4-5.txt
    gmt plot 4-5.txt -Sc0.5c -Gred -W0.01c,black
    gmt plot 3-4.txt -Sc0.4c -Gred -W0.01c,black
    gmt plot 2-3.txt -Sc0.3c -Gred -W0.01c,black
    gmt plot 1-2.txt -Sc0.2c -Gred -W0.01c,black
    gmt plot 0-1.txt -Sc0.1c -Gred -W0.01c,black

    @REM 图例
    echo G 0.2c > legend.txt
    echo S 0.2i c 0.5c red 0.01p 0.4i 4 - 5 >> legend.txt
    echo G 0.2c >> legend.txt
    echo S 0.2i c 0.4c red 0.01p 0.4i 3 - 4 >> legend.txt
    echo G 0.2c >> legend.txt
    echo S 0.2i c 0.3c red 0.01p 0.4i 2 - 3 >> legend.txt
    echo G 0.2c >> legend.txt
    echo S 0.2i c 0.2c red 0.01p 0.4i 1 - 2 >> legend.txt
    echo G 0.2c >> legend.txt
    echo S 0.2i c 0.1c red 0.01p 0.4i 0 - 1 >> legend.txt
    gmt legend legend.txt -DjBR+w2.6c/4.8c -F+p0.02c

    @REM 断层名
    echo 120.114796646 33.8724803462 30 F3 洪泽—沟墩断裂 | gmt text -F+f18p,39,black+jTL+a -Dj0.5c/1.5c
    echo 120.365959695	33.5288331302 30 F4 盐城—南洋岸断裂 | gmt text -F+f18p,39,black+jTL+a -Dj-3c/1.2c
    echo 120.365959695	33.5288331302 26 F5 陈家堡—小海断裂 | gmt text -F+f18p,39,black+jTL+a -Dj-3.5c/5c

    @REM 地名
    echo 119.549 33.125 宝应 | gmt text -F+f22p,39,black+jTL -Dj-0.15c/-1.2c
    echo 120.649 32.895 东台 | gmt text -F+f22p,39,black+jTL -Dj-1.1c/-0.9c
    echo 120.25 33.874 射阳 | gmt text -F+f22p,39,black+jTL -Dj-0.5c/-0.6c
    echo 119.802 33.701 建湖 | gmt text -F+f22p,39,black+jTL -Dj-1.2c/-1.1c

    @REM faults
    gmt plot chinafaultDQD.dat -W0.01c,black
    @REM 投影指定距离取点
    gmt project -C119.60/33.514 -A45 -L0/40 -G40 -Q > tmp1
    gmt project -C119.60/33.514 -A135 -L0/20 -G20 -Q > tmp2
    
    gmt project -C120.0/33.72 -A122 -L0/40 -G40 -Q > tmp4
    gmt project -C120.0/33.72 -A32 -L0/20 -G20 -Q > tmp3

    gmt project -C119.45/33.14 -A90 -L0/30 -G30 -Q > tmp5
    gmt project -C119.45/33.14 -A180 -L0/30 -G30 -Q > tmp6

    gmt project -C120.35/33.02 -A150 -L0/40 -G40 -Q > tmp7
    @REM 绘制剖面线
    gmt plot tmp1 -W0.05c,black
    gmt plot tmp2 -W0.05c,black
    gmt plot tmp3 -W0.05c,black
    gmt plot tmp4 -W0.05c,black
    gmt plot tmp5 -W0.05c,black
    gmt plot tmp6 -W0.05c,black
    gmt plot tmp7 -W0.05c,black

    @REM 闭合矩形
    gmt project -C119.905987375/33.767990413 -A135 -L0/20 -G20 -Q > tmp11
    gmt project -C119.752319553/33.3867236233 -A45 -L0/40 -G40 -Q > tmp21
    
    gmt project -C120.365959695/33.5288331302 -A32 -L0/20 -G20 -Q > tmp41
    gmt project -C120.114796646/33.8724803462 -A122 -L0/40 -G40 -Q > tmp31

    gmt project -C119.772206284/33.1395852798 -A180 -L0/30 -G30 -Q > tmp51
    gmt project -C119.45/32.8702038223 -A90 -L0/30 -G30 -Q > tmp61

    gmt plot tmp11 -W0.05c,black
    gmt plot tmp21 -W0.05c,black
    gmt plot tmp31 -W0.05c,black
    gmt plot tmp41 -W0.05c,black
    gmt plot tmp51 -W0.05c,black
    gmt plot tmp61 -W0.05c,black

    @REM 绘制标识
    echo 119.6 33.514 A | gmt text -F+f18p+jTR -Dx-0.3c/0.5c
    echo 119.905987375 33.767990413 C | gmt text -F+f18p+jTR -Dx-0.2c/0.4c
    echo 119.752319553 33.3867236233 B | gmt text -F+f18p+jTL -Dx0.0c/-0.05c

    echo 120 33.72 D | gmt text -F+f18p+jTR -Dx-0.05c/0.5c
    echo 120.114796646	33.8724803462 E | gmt text -F+f18p+jCB -Dx0.1c/0.1c
    echo 120.365959695	33.5288331302 F | gmt text -F+f18p+jCB -Dx-0.1c/-0.4c
    
    echo 119.45	33.14 I | gmt text -F+f18p+jBC -Dx0.0c/0.3c
    echo 119.45	32.8702038223 J | gmt text -F+f18p+jTL -Dj-0.3c/-0.3c
    echo 119.772206284	33.1395852798 K | gmt text -F+f18p+jBC -Dj-0.15c/0.3c

    echo 120.35	33.02 M | gmt text -F+f18p+jTR -Dx-0.2c/0.4c
    echo 120.563758464	32.7082838842 N | gmt text -F+f18p+jTL -Dj-0.1c/0.2c

    @REM 沿剖面取事件
    gmt project loc.txt -C119.6/33.514 -E119.752319553/33.3867236233 -Fxyzpq -W0/50 -Q -Lw > AB
    gmt project loc.txt -C119.6/33.514 -E119.905987375/33.767990413 -Fxyzpq -W-20/0 -Q -Lw > AC
    gmt project loc.txt -C120/33.72 -E120.114796646/33.8724803462 -Fxyzpq -W-40/0 -Q -Lw > DE
    gmt project loc.txt -C120/33.72 -E120.365959695/33.5288331302 -Fxyzpq -W0/20 -Q -Lw > DF
    gmt project loc.txt -C119.45/33.14 -E119.772206284/33.1395852798 -Fxyzpq -W-30/0 -Q -Lw > IJ
    gmt project loc.txt -C119.45/33.14 -E119.45/32.8702038223 -Fxyzpq -W0/30 -Q -Lw > IK
    gmt project loc.txt -C120.35/33.02 -E120.563758464/32.7082838842 -Fxyzpq -W-1000/1000 -Q -Lw > MN
    gawk "{print $5,$4,$3}" AB > AB.txt
    gawk "{print $5,$4,$3}" AC > AC.txt
    gawk "{print $5,$4,$3}" DE > DE.txt
    gawk "{print $5,$4,$3}" DF > DF.txt
    gawk "{print $5,$4,$3}" IJ > IJ.txt
    gawk "{print $5,$4,$3}" IK > IK.txt
    gawk "{print $5,$4,$3}" MN > MN.txt

    gawk "{if ($3>0 &&$3<=1) print $1,$2,$3}" AB.txt > AB0-1.txt
    gawk "{if ($3>1 &&$3<=2) print $1,$2,$3}" AB.txt > AB1-2.txt
    gawk "{if ($3>2 &&$3<=3) print $1,$2,$3}" AB.txt > AB2-3.txt
    gawk "{if ($3>3 &&$3<=4) print $1,$2,$3}" AB.txt > AB3-4.txt
    gawk "{if ($3>4 &&$3<=5) print $1,$2,$3}" AB.txt > AB4-5.txt
    gawk "{if ($3>0 &&$3<=1) print $1,$2,$3}" AC.txt > AC0-1.txt
    gawk "{if ($3>1 &&$3<=2) print $1,$2,$3}" AC.txt > AC1-2.txt
    gawk "{if ($3>2 &&$3<=3) print $1,$2,$3}" AC.txt > AC2-3.txt
    gawk "{if ($3>3 &&$3<=4) print $1,$2,$3}" AC.txt > AC3-4.txt
    gawk "{if ($3>4 &&$3<=5) print $1,$2,$3}" AC.txt > AC4-5.txt
    gawk "{if ($3>0 &&$3<=1) print $1,$2,$3}" DE.txt > DE0-1.txt
    gawk "{if ($3>1 &&$3<=2) print $1,$2,$3}" DE.txt > DE1-2.txt
    gawk "{if ($3>2 &&$3<=3) print $1,$2,$3}" DE.txt > DE2-3.txt
    gawk "{if ($3>3 &&$3<=4) print $1,$2,$3}" DE.txt > DE3-4.txt
    gawk "{if ($3>4 &&$3<=5) print $1,$2,$3}" DE.txt > DE4-5.txt
    gawk "{if ($3>0 &&$3<=1) print $1,$2,$3}" DF.txt > DF0-1.txt
    gawk "{if ($3>1 &&$3<=2) print $1,$2,$3}" DF.txt > DF1-2.txt
    gawk "{if ($3>2 &&$3<=3) print $1,$2,$3}" DF.txt > DF2-3.txt
    gawk "{if ($3>3 &&$3<=4) print $1,$2,$3}" DF.txt > DF3-4.txt
    gawk "{if ($3>4 &&$3<=5) print $1,$2,$3}" DF.txt > DF4-5.txt
    gawk "{if ($3>0 &&$3<=1) print $1,$2,$3}" IJ.txt > IJ0-1.txt
    gawk "{if ($3>1 &&$3<=2) print $1,$2,$3}" IJ.txt > IJ1-2.txt
    gawk "{if ($3>2 &&$3<=3) print $1,$2,$3}" IJ.txt > IJ2-3.txt
    gawk "{if ($3>3 &&$3<=4) print $1,$2,$3}" IJ.txt > IJ3-4.txt
    gawk "{if ($3>4 &&$3<=5) print $1,$2,$3}" IJ.txt > IJ4-5.txt
    gawk "{if ($3>0 &&$3<=1) print $1,$2,$3}" IK.txt > IK0-1.txt
    gawk "{if ($3>1 &&$3<=2) print $1,$2,$3}" IK.txt > IK1-2.txt
    gawk "{if ($3>2 &&$3<=3) print $1,$2,$3}" IK.txt > IK2-3.txt
    gawk "{if ($3>3 &&$3<=4) print $1,$2,$3}" IK.txt > IK3-4.txt
    gawk "{if ($3>4 &&$3<=5) print $1,$2,$3}" IK.txt > IK4-5.txt
    gawk "{if ($3>0 &&$3<=1) print $1,$2,$3}" MN.txt > MN0-1.txt
    gawk "{if ($3>1 &&$3<=2) print $1,$2,$3}" MN.txt > MN1-2.txt
    gawk "{if ($3>2 &&$3<=3) print $1,$2,$3}" MN.txt > MN2-3.txt
    gawk "{if ($3>3 &&$3<=4) print $1,$2,$3}" MN.txt > MN3-4.txt
    gawk "{if ($3>4 &&$3<=5) print $1,$2,$3}" MN.txt > MN4-5.txt


    @REM 小图
    gmt basemap -R0/20/0/30 -JX4c/-4c  -Y-6c -Bwsne -Bxa10f10 -Bya10f10
    echo 2 1 A | gmt text -F+f18p+jTC 
    echo 18 1 B | gmt text -F+f18p+jTC
    echo 17 25 (a) | gmt text -F+f18p+jTC
    gmt plot AB4-5.txt -Sc0.5c -Gred -W0.01c,black
    gmt plot AB3-4.txt -Sc0.4c -Gred -W0.01c,black
    gmt plot AB2-3.txt -Sc0.3c -Gred -W0.01c,black
    gmt plot AB1-2.txt -Sc0.2c -Gred -W0.01c,black
    gmt plot AB0-1.txt -Sc0.1c -Gred -W0.01c,black
    gmt basemap -R-10/10/0/30 -JX4c/-4c  -BWNse -Bxa10f10 -Bya10f10

    gmt basemap -R0/40/0/30 -JX8c/-4c -X6c -Bwsne -Bxa10f10 -Bya10f10
    echo 2 1 A | gmt text -F+f18p+jTC 
    echo 38 1 C | gmt text -F+f18p+jTC
    echo 37 25 (b) | gmt text -F+f18p+jTC
    gmt plot AC4-5.txt -Sc0.5c -Gred -W0.01c,black
    gmt plot AC3-4.txt -Sc0.4c -Gred -W0.01c,black
    gmt plot AC2-3.txt -Sc0.3c -Gred -W0.01c,black
    gmt plot AC1-2.txt -Sc0.2c -Gred -W0.01c,black
    gmt plot AC0-1.txt -Sc0.1c -Gred -W0.01c,black
    gmt basemap -R-20/20/0/30 -JX8c/-4c  -BWNse  -Bxa10f10 -Bya10f10

    gmt basemap -R0/20/0/32 -JX4c/-4c -X10c -Bwsne -Bxa10f10 -Bya10f10
    echo 2 1 D | gmt text -F+f18p+jTC 
    echo 18 1 E | gmt text -F+f18p+jTC
    echo 17 25 (c) | gmt text -F+f18p+jTC
    gmt plot DE4-5.txt -Sc0.5c -Gred -W0.01c,black
    gmt plot DE3-4.txt -Sc0.4c -Gred -W0.01c,black
    gmt plot DE2-3.txt -Sc0.3c -Gred -W0.01c,black
    gmt plot DE1-2.txt -Sc0.2c -Gred -W0.01c,black
    gmt plot DE0-1.txt -Sc0.1c -Gred -W0.01c,black
    gmt basemap -R-10/10/0/30 -JX4c/-4c  -BWNse -Bxa10f10 -Bya10f10

    gmt basemap -R0/40/0/30 -JX8c/-4c -X6c -Bwsne -Bxa10f10 -Bya10f10
    echo 2 1 D | gmt text -F+f18p+jTC 
    echo 38 1 F | gmt text -F+f18p+jTC
    echo 37 25 (d) | gmt text -F+f18p+jTC
    gmt plot DF4-5.txt -Sc0.5c -Gred -W0.01c,black
    gmt plot DF3-4.txt -Sc0.4c -Gred -W0.01c,black
    gmt plot DF2-3.txt -Sc0.3c -Gred -W0.01c,black
    gmt plot DF1-2.txt -Sc0.2c -Gred -W0.01c,black
    gmt plot DF0-1.txt -Sc0.1c -Gred -W0.01c,black
    gmt basemap -R-20/20/0/30 -JX8c/-4c  -BWNse -Bxa10f10 -Bya10f10

    gmt basemap -R0/30/0/30 -JX6c/-4C -X-22c -Y-6c -Bwsne -Bxa10f10 -Bya10f10
    echo 2 1 I | gmt text -F+f18p+jTC 
    echo 28 1 K | gmt text -F+f18p+jTC
    echo 27 25 (e) | gmt text -F+f18p+jTC
    gmt plot IJ4-5.txt -Sc0.5c -Gred -W0.01c,black
    gmt plot IJ3-4.txt -Sc0.4c -Gred -W0.01c,black
    gmt plot IJ2-3.txt -Sc0.3c -Gred -W0.01c,black
    gmt plot IJ1-2.txt -Sc0.2c -Gred -W0.01c,black
    gmt plot IJ0-1.txt -Sc0.1c -Gred -W0.01c,black
    gmt basemap -R-15/15/0/30 -JX6c/-4c  -BWNse -Bxa10f10 -Bya10f10

    gmt basemap -R0/30/0/30 -JX6C/-4c -X8c -Bwsne -Bxa10f10 -Bya10f10
    echo 2 1 I | gmt text -F+f18p+jTC 
    echo 28 1 J | gmt text -F+f18p+jTC
    echo 27 25 (f) | gmt text -F+f18p+jTC
    gmt plot IK4-5.txt -Sc0.5c -Gred -W0.01c,black
    gmt plot IK3-4.txt -Sc0.4c -Gred -W0.01c,black
    gmt plot IK2-3.txt -Sc0.3c -Gred -W0.01c,black
    gmt plot IK1-2.txt -Sc0.2c -Gred -W0.01c,black
    gmt plot IK0-1.txt -Sc0.1c -Gred -W0.01c,black
    gmt basemap -R-15/15/0/30 -JX6c/-4c  -BWNse -Bxa10f10 -Bya10f10

    gmt basemap -R0/40/0/30 -JX8C/-4c -X8c -Bwsne -Bxa10f10 -Bya10f10
    echo 2 1 M | gmt text -F+f18p+jTC 
    echo 38 1 N | gmt text -F+f18p+jTC
    echo 37 25 (g) | gmt text -F+f18p+jTC
    gmt plot MN4-5.txt -Sc0.5c -Gred -W0.01c,black
    gmt plot MN3-4.txt -Sc0.4c -Gred -W0.01c,black
    gmt plot MN2-3.txt -Sc0.3c -Gred -W0.01c,black
    gmt plot MN1-2.txt -Sc0.2c -Gred -W0.01c,black
    gmt plot MN0-1.txt -Sc0.1c -Gred -W0.01c,black
    gmt basemap -R-20/20/0/30 -JX8c/-4c  -BWNse -Bxa10f10 -Bya10f10

gmt end
del gmt.*,tmp*,*.txt,0,1,2,3,4,AB,AC,DE,DF,IJ,IK,MN