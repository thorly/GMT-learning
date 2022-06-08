gmt set MAP_FRAME_TYPE plain
gmt set MAP_FRAME_PEN 0.5p
gmt set FONT_ANNOT_PRIMARY 8p,4
gmt set MAP_TICK_LENGTH_PRIMARY 2p/1p
@REM gmt set MAP_ANNOT_OBLIQUE lat_parallel
gmt set FORMAT_GEO_MAP dddF
gmt set FONT_LABEL 8p,4


gmt begin phi png
    @REM 绘制PHI
    set p1="200/20/0"
    gmt basemap -R104/107/34/38/-30/0 -JM8c -JZ2c -Bxaf -Byaf -BnZ -Bza5f5+l"depth(km)" -p%p1%

    gmt makecpt -Cjet -T0/1
    gmt plot3d phi.txt -p%p1% -L -C -W0.1p,black
    gmt plot aoi.txt -W1p,black -p%p1%
    gmt colorbar -DjBL+o1.5c/1.4c+w8c/0.2c+h -Bx0.2+l"PHI" -C


    @REM 绘制地形
    set p2="200/20"
    set p3="200/20/3000"
    gmt basemap -R104/107/34/38/0/3000 -JM8c -JZ2c -Bxaf -Byaf -BNEZ34 -Bza1000f1000 -p%p3% -Y1.9c
    gmt basemap -R104/107/34/38/0/3000 -JM8c -JZ2c -Bxaf -Byaf -BNEZ -Bza1000f1000+l"elevation(m)" -p%p3%


    gmt project -C107/34.91 -E107/38 -G0.01 -Q | gmt grdtrack -Gdem15.grd | gawk "{print $1,$2,$4}" > tmp1.txt
    copy tmp1.txt tmp2.txt
    echo 107 38 0 >> tmp1.txt
    echo 107 34.91 0 >> tmp1.txt
    gmt plot3d tmp1.txt -p%p2% -W0.5p,gray -Ggray
    gmt plot3d tmp2.txt -p%p2% -W0.5p
    del tmp1.txt tmp2.txt

    gmt project -C107/37.99 -E104/37.99 -G0.01 -Q | gmt grdtrack -Gdem15.grd | gawk "{print $1,$2,$4}" > tmp1.txt
    copy tmp1.txt tmp2.txt
    echo 104 38 0 >> tmp1.txt
    echo 107 38 0 >> tmp1.txt
    gmt plot3d tmp1.txt -p%p2% -W0.5p,gray -Ggray
    gmt plot3d tmp2.txt -p%p2% -W0.5p
    del tmp1.txt tmp2.txt


    @REM gmt grdcut -R104/107/34/38 @earth_relief_15s.grd -Gdem15.grd
    gmt makecpt -Cdem4 -T625/3938
    gmt grdview dem15_clip.grd -p%p2% -Gdem15_clip.grd -Qc600 -C -I+d


    gmt clip aoi.txt -p%p2%
    gmt grdtrack -Gdem15.grd fault_blue.txt | gmt plot3d -W0.5p,blue -p%p2%
    gmt grdtrack -Gdem15.grd fault_red.txt | gmt plot3d -W0.5p,red -p%p2%
    gmt grdtrack -Gdem15.grd fault_orange.txt | gmt plot3d -W0.5p,orange -p%p2%
    gmt clip -C


    gmt project -C106.69/34.91 -E107/34.91 -G0.01 -Q | gmt grdtrack -Gdem15.grd | gawk "{print $1,$2,$4}" > tmp1.txt
    copy tmp1.txt tmp2.txt
    echo 107 34.91 0 >> tmp1.txt
    echo 106.69 34.91 0 >> tmp1.txt
    gmt plot3d tmp1.txt -p%p2% -W0.5p,gray -Ggray
    gmt plot3d tmp2.txt -p%p2% -W0.5p
    del tmp1.txt tmp2.txt

    gmt project -C104/38 -E104.01/37.06 -G0.01 -Q | gmt grdtrack -Gdem15.grd | gawk "{print $1,$2,$4}" > tmp1.txt
    copy tmp1.txt tmp2.txt
    echo 104.01 37.06 0 >> tmp1.txt
    echo 104 38 0 >> tmp1.txt
    gmt plot3d tmp1.txt -p%p2% -W0.5p,gray -Ggray
    gmt plot3d tmp2.txt -p%p2% -W0.5p
    del tmp1.txt tmp2.txt

    gmt project -C104.01/37.06 -E104.64/36.89 -G0.01 -Q | gmt grdtrack -Gdem15.grd | gawk "{print $1,$2,$4}" > tmp1.txt
    copy tmp1.txt tmp2.txt
    echo 104.64 36.89 0 >> tmp1.txt
    echo 104.01 37.06 0 >> tmp1.txt
    gmt plot3d tmp1.txt -p%p2% -W0.5p,gray -Ggray
    gmt plot3d tmp2.txt -p%p2% -W0.5p
    del tmp1.txt tmp2.txt

    gmt project -C104.64/36.89 -E104.70/36.85 -G0.01 -Q | gmt grdtrack -Gdem15.grd | gawk "{print $1,$2,$4}" > tmp1.txt
    copy tmp1.txt tmp2.txt
    echo 104.70 36.85 0 >> tmp1.txt
    echo 104.64 36.89 0 >> tmp1.txt
    gmt plot3d tmp1.txt -p%p2% -W0.5p,gray -Ggray
    gmt plot3d tmp2.txt -p%p2% -W0.5p
    del tmp1.txt tmp2.txt

    gmt project -C104.70/36.85 -E105.19/36.71 -G0.01 -Q | gmt grdtrack -Gdem15.grd | gawk "{print $1,$2,$4}" > tmp1.txt
    copy tmp1.txt tmp2.txt
    echo 105.19 36.71 0 >> tmp1.txt
    echo 104.70 36.85 0 >> tmp1.txt
    gmt plot3d tmp1.txt -p%p2% -W0.5p,gray -Ggray
    gmt plot3d tmp2.txt -p%p2% -W0.5p
    del tmp1.txt tmp2.txt

    gmt project -C105.19/36.71 -E105.25/36.63 -G0.01 -Q | gmt grdtrack -Gdem15.grd | gawk "{print $1,$2,$4}" > tmp1.txt
    copy tmp1.txt tmp2.txt
    echo 105.25 36.63 0 >> tmp1.txt
    echo 105.19 36.71 0 >> tmp1.txt
    gmt plot3d tmp1.txt -p%p2% -W0.5p,gray -Ggray
    gmt plot3d tmp2.txt -p%p2% -W0.5p
    del tmp1.txt tmp2.txt

    gmt project -C105.25/36.63 -E105.69/36.43 -G0.01 -Q | gmt grdtrack -Gdem15.grd | gawk "{print $1,$2,$4}" > tmp1.txt
    copy tmp1.txt tmp2.txt
    echo 105.69 36.43 0 >> tmp1.txt
    echo 105.25 36.63 0 >> tmp1.txt
    gmt plot3d tmp1.txt -p%p2% -W0.5p,gray -Ggray
    gmt plot3d tmp2.txt -p%p2% -W0.5p
    del tmp1.txt tmp2.txt

    gmt project -C105.69/36.43 -E105.74/36.39 -G0.01 -Q | gmt grdtrack -Gdem15.grd | gawk "{print $1,$2,$4}" > tmp1.txt
    copy tmp1.txt tmp2.txt
    echo 105.74 36.39 0 >> tmp1.txt
    echo 105.69 36.43 0 >> tmp1.txt
    gmt plot3d tmp1.txt -p%p2% -W0.5p,gray -Ggray
    gmt plot3d tmp2.txt -p%p2% -W0.5p
    del tmp1.txt tmp2.txt

    gmt project -C105.74/36.39 -E106.12/36.02 -G0.01 -Q | gmt grdtrack -Gdem15.grd | gawk "{print $1,$2,$4}" > tmp1.txt
    copy tmp1.txt tmp2.txt
    echo 106.12 36.02 0 >> tmp1.txt
    echo 105.74 36.39 0 >> tmp1.txt
    gmt plot3d tmp1.txt -p%p2% -W0.5p,gray -Ggray
    gmt plot3d tmp2.txt -p%p2% -W0.5p
    del tmp1.txt tmp2.txt

    gmt project -C106.12/36.02 -E106.23/35.70 -G0.01 -Q | gmt grdtrack -Gdem15.grd | gawk "{print $1,$2,$4}" > tmp1.txt
    copy tmp1.txt tmp2.txt
    echo 106.23 35.70 0 >> tmp1.txt
    echo 106.12 36.02 0 >> tmp1.txt
    gmt plot3d tmp1.txt -p%p2% -W0.5p,gray -Ggray
    gmt plot3d tmp2.txt -p%p2% -W0.5p
    del tmp1.txt tmp2.txt

    gmt project -C106.23/35.70 -E106.33/35.41 -G0.01 -Q | gmt grdtrack -Gdem15.grd | gawk "{print $1,$2,$4}" > tmp1.txt
    copy tmp1.txt tmp2.txt
    echo 106.33 35.41 0 >> tmp1.txt
    echo 106.23 35.70 0 >> tmp1.txt
    gmt plot3d tmp1.txt -p%p2% -W0.5p,gray -Ggray
    gmt plot3d tmp2.txt -p%p2% -W0.5p
    del tmp1.txt tmp2.txt

    gmt project -C106.33/35.41 -E106.46/35.21 -G0.01 -Q | gmt grdtrack -Gdem15.grd | gawk "{print $1,$2,$4}" > tmp1.txt
    copy tmp1.txt tmp2.txt
    echo 106.46 35.21 0 >> tmp1.txt
    echo 106.33 35.41 0 >> tmp1.txt
    gmt plot3d tmp1.txt -p%p2% -W0.5p,gray -Ggray
    gmt plot3d tmp2.txt -p%p2% -W0.5p
    del tmp1.txt tmp2.txt

    gmt project -C106.46/35.21 -E106.58/35.04 -G0.01 -Q | gmt grdtrack -Gdem15.grd | gawk "{print $1,$2,$4}" > tmp1.txt
    copy tmp1.txt tmp2.txt
    echo 106.58 35.04 0 >> tmp1.txt
    echo 106.46 35.21 0 >> tmp1.txt
    gmt plot3d tmp1.txt -p%p2% -W0.5p,gray -Ggray
    gmt plot3d tmp2.txt -p%p2% -W0.5p
    del tmp1.txt tmp2.txt

    gmt project -C106.58/35.04 -E106.69/34.91 -G0.01 -Q | gmt grdtrack -Gdem15.grd | gawk "{print $1,$2,$4}" > tmp1.txt
    copy tmp1.txt tmp2.txt
    echo 106.69 34.91 0 >> tmp1.txt
    echo 106.58 35.04 0 >> tmp1.txt
    gmt plot3d tmp1.txt -p%p2% -W0.5p,gray -Ggray
    gmt plot3d tmp2.txt -p%p2% -W0.5p
    del tmp1.txt tmp2.txt


    echo 104.01 37.06 1753.04646825 > tmp3.txt
    echo 104.01 37.06 0 >> tmp3.txt
    gmt plot3d tmp3.txt -p%p2% -W0.5p

    echo 104 38 1611.625 > tmp3.txt
    echo 104 38 0 >> tmp3.txt
    gmt plot3d tmp3.txt -p%p2% -W0.5p

    echo 106.69 34.91 0 > tmp3.txt
    echo 106.69 34.91 1251.70410425 >> tmp3.txt
    gmt plot3d tmp3.txt -p%p2% -W0.5p

    echo 107 34.91 0 > tmp3.txt
    echo 107 34.91 1219.71496875 >> tmp3.txt
    gmt plot3d tmp3.txt -p%p2% -W0.5p

gmt end
del gmt.*,tmp3.txt