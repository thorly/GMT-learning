## 1. basemap

```bash
# 只保留label
gmt basemap -JX10c -R0/20/0/20 -BWSne -Bxa0+l"x label" -Bya0+l"y label" -png nolabel
# log轴
gmt basemap -JX10c/10cl -R-1/6/1/10000 -Bxa1f0.5+l"Magnitude" -Bya10pf3p+l"Number" -BWSne -png log
# 比例尺
gmt basemap -R100/110/50/60 -JM5c -Baf -BWSne -Lg105/55+c55+w400k+u+f -png scale
```

## 2. clip
```bash
gmt set MAP_FRAME_TYPE plain

gmt begin jiangxi png
    gmt basemap -JM12c -R113/119/24/31 -Baf -BWSne+glightblue
    # 绘制文件jiangxi.dat指定的多边形内数据
    gmt clip jiangxi.dat
    gmt grdimage jiangxi.grd -I+d -Cdem2
    gmt clip -C
gmt end
```

## 3. coast
```bash
# 绘制比例尺
gmt coast -Da -W1 -A1000000 -Lf103.72/32.95/33.1/20+u --FONT_ANNOT_PRIMARY=6p,4 --MAP_ANNOT_OFFSET_PRIMARY=2p --MAP_SCALE_HEIGHT=3p

# 绘制指北针
gmt coast -Da -I0 -A1000000 -Tf104.12/33.48/0.2i/2 --FONT_TITLE=5p,4 --MAP_TITLE_OFFSET=2p

# 填充水域
gmt coast  -S89/195/226 -Di -Ia -W1 -A1000000
```

## 4. colorbar
```bash
# 垂直
gmt colorbar -DjBL+o0.1c/0.1c+w2c/0.2c -Bx0.1 -By+lm -C%name%.cpt --FONT_ANNOT_PRIMARY=6p,4 --MAP_ANNOT_OFFSET_PRIMARY=2p --MAP_FRAME_PEN=0.4p
# 水平
gmt colorbar -DjBL+o0.1c/0.1c+w2c/0.2c+h -Bx0.1 -By+lm -C%name%.cpt --FONT_ANNOT_PRIMARY=6p,4 --MAP_ANNOT_OFFSET_PRIMARY=2p --MAP_FRAME_PEN=0.4p
```

## 5. gmtmath
```bash
# 更多计算见gmt math的help
# C2 * 5.6 / (-4) / PI
gmt math asc_unw.xyz -C2 5.6 MUL -4 DIV PI DIV = asc_disp.xyz
```
## 6. grdcontour
```bash
gmtset MAP_FRAME_TYPE plain
gmt begin contour png
    gmt basemap -R155:40W/155:16W/19:41N/19:57N -JM15c -Baf -BWSne
    gmt grdimage maunakea.grd -I+d
    # 主要等高线 500m 间隔(-A)，次要等高线 100m 间隔(-C)
    gmt grdcontour maunakea.grd -C100 -Q100 -A400+f8p,25,darkred+o
gmt end
```

## 7. grdcut
```bash
# 使用GMT提供的dem进行裁剪
gmt grdcut @earth_relief_15s  -R100/102/32/34 -Gdem_small.grd
```

## 8. grdimage
```bash
# dem1为自带cpt（查看gmt安装目录）,Q表示不绘制none值区域
gmt grdimage unw.grd  -Cdem1 -Q

# 自动计算并绘制光照效果
gmt grdimage unw.grd  -I+d -Cdemgray.cpt -Q

# 绘制地形光照效果
# -I 和 -R 选项必须一致(可以使用grdsample对grd进行重采样)
grdgradient dem.grd -Ne0.8 -A100 -Gdem.grad
gmt grdimage unw.grd -Cunw.cpt -Q -Idem.grad
```

## 9. grdmath
```bash
# 计算dem的东西方向的一阶导数(适用于地理坐标)，更多计算见gmt grdmath的help
gmt grdmath dem.grd -M DDX = dem_ddx.grd
# 计算x方向的一阶导数
gmt grdmath data.grd DDX = data_ddx.grd
```

## 10. grdview
```bash
gmt set MAP_FRAME_TYPE plain
gmt begin jiangxi png
	# 中值滤波平滑地形，平滑直径50km
	gmt grdfilter jiangxi.grd -Fm50 -D4 -Gjiangxi_filter.grd
	gmt basemap -JM12c -JZ6c -BESnwZ -R113/119/24/31/-100/2100 -p140/25 -Baf -Bzaf+l"elevation(m)"
    # 三维
	gmt grdview jiangxi_filter.grd -Cdem3 -p140/25 -Qi400 -N-100+g150/150/150 -I+d -JZ6c
gmt end
```

## 12. makecpt
```bash
# 周期性cpt
gmt makecpt -Cjet -T0/2.8 -Ww
# 普通cpt
gmt makecpt -Crainbow -T-3.14/3.14/0.1
```

## 12. meca
```bash
# (震中位置、节理面1、节理面2、地震矩、沙滩球位置)
echo 103.777541666667 33.215625 9 246 57 -173 153 84 -33 8.9 18 103.85 33.3 > earthquake
gmt meca earthquake -CP2p -Gred -Sc1.3c -L0.5

# (震中位置、断层走向、倾角、滑动角、矩震级、沙滩球位置)
echo 103.777541666667 33.215625 9 153 84 -33 5.7 103.85 33.3 > earthquake
gmt meca earthquake -CP2p -Gred -Sa1.3c -L0.5
```