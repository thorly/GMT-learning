gmt set FORMAT_DATE_MAP "yyyymmdd"
gmt set FORMAT_TIME_PRIMARY_MAP Abbreviated
gmt set FORMAT_DATE_IN "yyyymmdd"
gmt set MAP_FRAME_PEN 0.5p
gmt set FONT_ANNOT_PRIMARY 8p,4
gmt set MAP_TICK_LENGTH_PRIMARY -3p
gmt set FONT_LABEL 8p,4
gmt set MAP_GRID_PEN_PRIMARY 0.1p,gray,-.-
gmt set MAP_LABEL_OFFSET 5p
@REM gmt set MAP_ANNOT_ORTHO Z

gmt begin points_ts png E500

        set R="2006-12T/2011-3T/-1400/100"

        gmt basemap -R%R% -JX8c/4c -Bxa12Of6Og6O+l"@%%39%%时间" -Bya400f200g200+l"@%%39%%累计形变量 @%%4%%(mm)" -BWSne

        gmt plot points_ts.txt -i0,1 -St0.2c,black -Gblack
        gmt plot points_ts.txt -i0,1 -W0.4p,black

        gmt plot points_ts.txt -i0,2 -St0.2c,red -Gred
        gmt plot points_ts.txt -i0,2 -W0.4p,red

        gmt plot points_ts.txt -i0,3 -St0.2c,green -Ggreen
        gmt plot points_ts.txt -i0,3 -W0.4p,green

        gmt plot points_ts.txt -i0,4 -St0.2c,purple -Gpurple
        gmt plot points_ts.txt -i0,4 -W0.4p,purple

        gmt plot points_ts.txt -i0,5 -St0.2c,blue -Gblue
        gmt plot points_ts.txt -i0,5 -W0.4p,blue

        gmt plot points_ts.txt -i0,6 -St0.2c,cyan -Gcyan
        gmt plot points_ts.txt -i0,6 -W0.4p,cyan

        echo N 1 > legend.txt
        echo S 0.1i - 0.4c - 0.4p,black 0.22i A >> legend.txt
        echo S 0.1i - 0.4c - 0.4p,red 0.22i B >> legend.txt
        echo S 0.1i - 0.4c - 0.4p,green 0.22i C >> legend.txt
        echo S 0.1i - 0.4c - 0.4p,purple 0.22i D >> legend.txt
        echo S 0.1i - 0.4c - 0.4p,blue 0.22i E >> legend.txt
        echo S 0.1i - 0.4c - 0.4p,cyan 0.22i F >> legend.txt
        gmt legend legend.txt -DjBL+w3.1c+o0.2c/0.1c  --FONT_ANNOT_PRIMARY=6p,4

        echo N 1 > legend.txt
        echo S 0.1i t 0.2c black 0.4p,black 0.22i A >> legend.txt
        echo S 0.1i t 0.2c red 0.4p,red 0.22i B >> legend.txt
        echo S 0.1i t 0.2c green 0.4p,green 0.22i C >> legend.txt
        echo S 0.1i t 0.2c purple 0.4p,purple 0.22i D >> legend.txt
        echo S 0.1i t 0.2c blue 0.4p,blue 0.22i E >> legend.txt
        echo S 0.1i t 0.2c cyan 0.4p,cyan 0.22i F >> legend.txt
        gmt legend legend.txt -DjBL+w3.1c+o0.2c/0.1c  --FONT_ANNOT_PRIMARY=6p,4

gmt end

del gmt.*,legend.txt