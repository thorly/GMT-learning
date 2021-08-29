gmt set MAP_FRAME_TYPE plain
gmt set FONT_ANNOT_PRIMARY 12p,4
gmt set MAP_TICK_LENGTH 2p/1p
gmt set MAP_FRAME_PEN 1p
gmt set FORMAT_GEO_MAP ddd:mm:ssF

gmt begin font png
    gmt basemap -R96.7/107/19.5/30.3 -JM8c -Bxa2f1 -Bya2f1 -BWSne
	@REM ÇÐ»»34ºÅ×ÖÌå»æÖÆÌØÊâ·ûºÅ£¬ÇÐ»»39ºÅ×ÖÌå»æÖÆÖÐÎÄ
    echo L 6p,4 L @%%34%%\254 @%%39%%Å­½­¶ÏÁÑ > legend.txt
    echo L 6p,4 L @%%34%%\255 @%%39%%À½²×½­¶ÏÁÑ >> legend.txt
    echo L 6p,4 L @%%34%%\256 @%%39%%½ðÉ³½­¶ÏÁÑ >> legend.txt
    echo L 6p,4 L @%%34%%\257 @%%39%%Ë¥ÀÍÉ½¶ÏÁÑ >> legend.txt
    echo L 6p,4 L @%%34%%\260 @%%39%%ºìºÓ¶ÏÁÑ >> legend.txt
    echo L 6p,4 L @%%34%%\261 @%%39%%Ð¡½ðºÓ¶ÏÁÑ >> legend.txt
    echo L 6p,4 L @%%34%%\262 @%%39%%ÂÌÖ­½­¶ÏÁÑ >> legend.txt
    echo L 6p,4 L @%%34%%\263 @%%39%%Ð¡½­¶ÏÁÑ >> legend.txt
    echo L 6p,4 L @%%34%%\264 @%%39%%ÃÖÀÕ¶ÏÁÑ >> legend.txt
    gmt legend legend.txt -DjBL+w1.8c+o6c/0c --FONT_ANNOT_PRIMARY=6p

gmt end
del gmt.*, legend.txt