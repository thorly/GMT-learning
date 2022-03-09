gmt set MAP_FRAME_TYPE plain
gmt set MAP_FRAME_PEN 0.6p
gmt set FONT_ANNOT_PRIMARY 12p,4
gmt set MAP_TICK_LENGTH 2p
gmt set FORMAT_GEO_MAP ddd.xxxF
gmt set MAP_GRID_PEN_PRIMARY 0.1p,gray,-

@REM 设置透视方位角和高度
set p="80/40"

gmt begin phi png E600
    gmt basemap -R102/103.5/26.6/30.2/-60/0 -JZ5c -JM10c -BNEwsZ -Bxa30mf15mg15m -Bya30mf15mg15m -Bza20f10g10 -p%p%
    @REM 下载并绘制dem
    @REM gmt grdcut -R102/103.5/26.6/30.2 @earth_relief_03s -Gdem.grd
    @REM gmt makecpt -Cgray -T-9000/6000 -H > dem.cpt
    @REM gmt grdimage dem.grd -Cdem.cpt -p%p% -I+d
    @REM 绘制三维闭锁系数图和颜色条
    gmt makecpt -Cjet -T0/1 -H > phi.cpt
    gmt plot3d phi.txt -p%p% -L -Cphi.cpt -W0.1p,black
    gmt colorbar -p%p% -DjBR+o-0.0c/28.4c+w10c/0.4c+h -Bx0.2 -Cphi.cpt --MAP_LABEL_OFFSET=2p --FONT_LABEL=8p,4 --FONT_ANNOT_PRIMARY=12p,4 --MAP_ANNOT_OFFSET_PRIMARY=2p --MAP_FRAME_PEN=0.2p
gmt end

del gmt.*,*.cpt,dem.grd