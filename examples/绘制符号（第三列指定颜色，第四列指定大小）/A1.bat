gmt set FONT_ANNOT_PRIMARY 8p,4
gmt set MAP_TICK_LENGTH 1p
gmt set MAP_GRID_PEN_PRIMARY 0.1p
gmt set MAP_FRAME_WIDTH 2p
gmt set FORMAT_GEO_MAP ddd:mm:ssF

set R="114.3/114.85/23.6/24"

gmt begin
    gmt figure A1 png
        gmt basemap -R%R% -JM8c -Bxa10mf5m -Bya10mf5m -BWSne

        gmt grdcut @earth_relief_03s -R%R% -Gdem.grd

        gmt makecpt -Cgray -T-8000/1900
        gmt grdimage dem.grd -C -I+d

        gmt makecpt -Cjet -T2/17
        gawk "{if($4>=1 && $4<2) print $2,$1,$3,$4}" Adata.txt | gmt plot -Sc0.1c -W0.1p,black -C
        gawk "{if($4>=2 && $4<3) print $2,$1,$3,$4}" Adata.txt | gmt plot -Sc0.2c -W0.1p,black -C
        gawk "{if($4>=3 && $4<4) print $2,$1,$3,$4}" Adata.txt | gmt plot -Sc0.3c -W0.1p,black -C
        gawk "{if($4>=4 && $4<5) print $2,$1,$3,$4}" Adata.txt | gmt plot -Sc0.4c -W0.1p,black -C
        gawk "{if($4>=5) print $2,$1,$3,$4}" Adata.txt | gmt plot -Sc0.5c -W0.1p,black -C

        gmt colorbar -DjBL+o0.1c/-0.8c+w7.8c/0.3c+h -Bx2 -By+lkm -C --FONT_ANNOT_PRIMARY=6p,4 --MAP_ANNOT_OFFSET_PRIMARY=2p --MAP_FRAME_PEN=0.4p

        echo S 0.1i c 0.1c - 0.1p,black 0.3i @%%4%%1.0~2.0 > legend.txt
        echo G 0.1c >> legend.txt
        echo S 0.1i c 0.2c - 0.1p,black 0.3i @%%4%%2.0~3.0 >> legend.txt
        echo G 0.1c >> legend.txt
        echo S 0.1i c 0.3c - 0.1p,black 0.3i @%%4%%3.0~4.0 >> legend.txt
        echo G 0.1c >> legend.txt
        echo S 0.1i c 0.4c - 0.1p,black 0.3i @%%4%%4.0~5.0 >> legend.txt
        echo G 0.2c >> legend.txt
        echo S 0.1i c 0.5c - 0.1p,black 0.3i @%%4%%5.0@%%40%%¼°ÒÔÉÏ >> legend.txt
        echo G 0.1c >> legend.txt

        gmt legend legend.txt -DjBL+w2.2c -F+p0.1p+gwhite@50 --FONT_ANNOT_PRIMARY=8p,40

gmt end
del gmt.conf, legend.txt, dem.grd