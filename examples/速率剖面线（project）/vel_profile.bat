gmt set MAP_FRAME_TYPE plain
gmt set FONT_ANNOT_PRIMARY 8p,4
gmt set MAP_FRAME_PEN 1p
gmt set MAP_TICK_LENGTH_PRIMARY 1p/0.5p
gmt set FONT_TITLE 12p,4
gmt set FONT_LABEL 10p,4

gmt begin profile png A0.1c
    gmt project vel_des.txt -i1,2,3 -C102.524046/29.614777 -E102.490006/29.597400 -Fxyzpq -W-0.1/0.1 -Q -Lw > p1.txt
    gmt basemap -R0/3.8/-60/10 -JX9c/4c -Bxa0.2f0.1g0.2+l"distance (km)" -Bya10f5g10+l"velocity (mm/yr)" -BWSne+glightblue+t" Velocity profile of AB"
    gmt plot p1.txt -i3,2 -Sc0.1c -Gred
    echo 0.1 5 A | gmt text -F+f12p,4,black
    echo 3.7 5 B | gmt text -F+f12p,4,black
gmt end
del gmt.conf, p1.txt