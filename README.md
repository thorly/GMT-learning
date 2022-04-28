# GMT-learning

[GMT绘图技巧](skills.md)

## basemap

```bash
# 只保留label
gmt basemap -JX10c -R0/20/0/20 -BWSne -Bxa0+l"x label" -Bya0+l"y label" -png nolabel
# log轴
gmt basemap -JX10c/10cl -R-1/6/1/10000 -Bxa1f0.5+l"Magnitude" -Bya10pf3p+l"Number" -BWSne -png log
# 比例尺
gmt basemap -R100/110/50/60 -JM5c -Baf -BWSne -Lg105/55+c55+w400k+u+f -png scale
```

## clip

只绘制指定的多边形内数据 [示例代码](examples/InSAR缠绕图叠加地形光照效果/unw.bat)

## coast

```bash
# 绘制比例尺
gmt coast -Da -W1 -A1000000 -Lf103.72/32.95/33.1/20+u --FONT_ANNOT_PRIMARY=6p,4 --MAP_ANNOT_OFFSET_PRIMARY=2p --MAP_SCALE_HEIGHT=3p

# 绘制指北针
gmt coast -Da -A1000000 -Tf104.12/33.48/0.2i/2 --FONT_TITLE=5p,4 --MAP_TITLE_OFFSET=2p

# 填充水域
gmt coast  -S89/195/226 -Df -A1000000
```

## colorbar

```bash
# 垂直
gmt colorbar -DjBL+o0.1c/0.1c+w2c/0.2c -Bx0.1 -By+lm -Ccpt --FONT_ANNOT_PRIMARY=6p,4 --MAP_ANNOT_OFFSET_PRIMARY=2p --MAP_FRAME_PEN=0.4p
# 水平
gmt colorbar -DjBL+o0.1c/0.1c+w2c/0.2c+h -Bx0.1 -By+lm -Ccpt --FONT_ANNOT_PRIMARY=6p,4 --MAP_ANNOT_OFFSET_PRIMARY=2p --MAP_FRAME_PEN=0.4p
```

## figure

[示例代码](examples/InSAR时空基线/baseline.bat)

## gmtmath

```bash
# 更多计算见gmt math的help
# C2 * 5.6 / (-4) / PI
gmt math asc_unw.xyz -C2 5.6 MUL -4 DIV PI DIV = asc_disp.xyz
```

## grdcontour

```bash
# 主要等高线 500m 间隔(-A)，次要等高线 100m 间隔(-C)
gmt grdcontour maunakea.grd -C100 -Q100 -A400+f8p,25,darkred+o
```

## grdcut

```bash
# 使用GMT提供的dem进行裁剪
gmt grdcut @earth_relief_15s -R100/102/32/34 -Gdem_small.grd
```

## grdimage

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

## grdmath

```bash
# 计算dem的东西方向的一阶导数(适用于地理坐标)，更多计算见gmt grdmath的help
gmt grdmath dem.grd -M DDX = dem_ddx.grd
# 计算x方向的一阶导数
gmt grdmath data.grd DDX = data_ddx.grd
# 重新缠绕数据至(-4,4) [w0 + mod(data - w0, w1 - w0)]
gmt grdmath unw.grd -4 SUB 4 -4 SUB MOD -4 ADD = wrap8.grd
```

## grdview

[示例代码](examples/三维地形图（grdview）/3d.bat)

## grdsample

```bash
# 将dem采样至与unw_re.grd相同的坐标空间（1256和1054表示unw_re.grd的行列数）
gmt grdsample dem.grd -Runw_re.grd -I1256+n/1054+n -Gdem_re.grd
```

[示例代码](examples/InSAR解缠图叠加地形光照效果/unw.bat)

## grdtrack

[示例代码](examples/高程剖面线（grdtrack）/profile.bat)

## inset

[示例代码](examples/滑坡地理位置/coverage.bat)

## legend

```bash
echo N 1 > legend.txt
echo S 1p c 0.2p black 0.1p,black 4p Gravity Point >> legend.txt
gmt legend legend.txt -DjTR+w1.6cc+o0.1c/0.1c -F+p0.2p+gwhite --FONT_ANNOT_PRIMARY=6p,4
```

## makecpt

```bash
# 周期性cpt
gmt makecpt -Cjet -T0/2.8 -Ww
# 普通cpt
gmt makecpt -Crainbow -T-3.14/3.14/0.1
```

## meca

```bash
# (震中位置、节理面1、节理面2、地震矩、沙滩球位置)
echo 103.777541666667 33.215625 9 246 57 -173 153 84 -33 8.9 18 103.85 33.3 > earthquake
gmt meca earthquake -CP2p -Gred -Sc1.3c -L0.5

# (震中位置、断层走向、倾角、滑动角、矩震级、沙滩球位置)
echo 103.777541666667 33.215625 9 153 84 -33 5.7 103.85 33.3 > earthquake
gmt meca earthquake -CP2p -Gred -Sa1.3c -L0.5
```

## plot3d

[示例代码](examples/三维断裂带闭锁系数图（plot3d）/phi.bat)

## project

[示例代码](examples/速率剖面线（project）/vel_profile.bat)

## velo

[示例代码](examples/GPS速度场/vel.sh)
