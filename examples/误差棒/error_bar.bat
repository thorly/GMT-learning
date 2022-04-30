gmt set FONT_ANNOT_PRIMARY 8p,4
gmt set MAP_FRAME_PEN 0.3p
gmt set MAP_TICK_LENGTH 1p/0.3p
gmt set MAP_GRID_PEN 0.1p,lightgray,-
gmt set FONT_LABEL 8p,4


gmt begin error_bar png E500
    gmt basemap -JX8c/4c -R90/103/0/15.1 -Bxa2f1+l"Longitude (\272)" -Bya2f2g2+l"slip rate (mm/a)"

    @REM Geodetic slip rates
    @REM Duvall and Clark.(2010)
    echo 97.29507047361167 10.52733118971061    > tmp1
    echo 102.58569252713778 0.6109324758842405 >> tmp1
    gmt plot tmp1 -W4p,yellow

    @REM Kirby et al.(2007)
    echo 94.25 7.980707395498392   > tmp1
    echo 94.25 12.109324758842444 >> tmp1
    echo 101.60307521214611 2.617363344051448  > tmp2
    echo 101.60307521214611 4.739549839228292 >> tmp2
    gmt plot tmp1 -W4p,33/80/160
    gmt plot tmp2 -W4p,33/80/160

    @REM Diao et al.(2019)
    echo 99.21988250368686 7.672025723472668  > tmp1
    echo 99.21988250368686 10.52733118971061 >> tmp1

    echo 99.22486280008702 4.469453376205788  > tmp2
    echo 99.22486280008702 6.55305466237942  >> tmp2
    gmt plot tmp1 -W4p,red
    gmt plot tmp2 -W4p,red

    @REM Zhao et al.(2022)
    echo 90.52270210409745 2.166666666666668  > tmp1
    echo 90.52270210409745 9.5               >> tmp1
    gmt plot tmp1 -W4p,242/166/1

    echo 93.13178294573643 7.055555555555555   > tmp1
    echo 93.13178294573643 13.777777777777777 >> tmp1
    gmt plot tmp1 -W4p,242/166/1

    echo 91.99557032115172 8.88888888888889    > tmp1
    echo 91.99557032115172 13.833333333333332 >> tmp1
    gmt plot tmp1 -W4p,242/166/1

    echo 94.20487264673311 7.666666666666667 > tmp1
    echo 94.20487264673311 12               >> tmp1
    gmt plot tmp1 -W4p,242/166/1

    echo 95.5094130675526 9.38888888888889    > tmp1
    echo 95.5094130675526 10.055555555555554 >> tmp1
    gmt plot tmp1 -W4p,242/166/1

    echo 96.7718715393134 9.5                 > tmp1
    echo 96.7718715393134 10.388888888888888 >> tmp1
    gmt plot tmp1 -W4p,242/166/1

    echo 98.20265780730897 10.166666666666666  > tmp1
    echo 98.20265780730897 10.833333333333332 >> tmp1
    gmt plot tmp1 -W4p,242/166/1

    echo 99.44407530454042 9.555555555555555   > tmp1
    echo 99.44407530454042 10.166666666666666 >> tmp1
    gmt plot tmp1 -W4p,242/166/1

    echo 100.62236987818383 9.5                 > tmp1
    echo 100.62236987818383 10.166666666666666 >> tmp1
    gmt plot tmp1 -W4p,242/166/1

    @REM Garthwaite et al (2013)
    echo 91.61683277962348 10                  > tmp1
    echo 91.61683277962348 11.944444444444443 >> tmp1
    gmt plot tmp1 -W4p,green

    echo 92.4795127353267 9.944444444444443   > tmp1
    echo 92.4795127353267 14.055555555555554 >> tmp1
    gmt plot tmp1 -W4p,green

    @REM Wang and shen (2019)
    echo 93.9734219269103 10                  > tmp1
    echo 93.9734219269103 13.944444444444443 >> tmp1
    gmt plot tmp1 -W4p,252/190/203

    echo 98.03433001107419 8    > tmp1
    echo 98.03433001107419 12  >> tmp1
    gmt plot tmp1 -W4p,252/190/203

    echo 101.96899224806201 3.055555555555557 > tmp1
    echo 101.96899224806201 7                >> tmp1
    gmt plot tmp1 -W4p,252/190/203

    @REM Zheng et al.(2017)
    echo 93.82613510520487 10.944444444444443  > tmp1
    echo 93.82613510520487 14.777777777777777 >> tmp1
    gmt plot tmp1 -W4p,purple

    echo 99.1705426356589 5.222222222222223  > tmp1
    echo 99.1705426356589 7.055555555555555 >> tmp1
    gmt plot tmp1 -W4p,purple


    @REM Geological slip rates
    @REM Li et al.(2005)
    echo 92.15385731209051 9.215434083601286 1.2    | gmt plot -Ey+w4p+p0.3p,black -Sc0.15c -W0.3p -G26/168/214

    @REM Guo et al.(2007)
    echo 98.9248362062713 5.97427652733119 0.7      | gmt plot -Ey+w4p+p0.3p,black -Sc0.15c -W0.3p -Gred

    @REM Lin et al.(2008)
    echo 101.95690544689699 2.463022508038584 0.85  | gmt plot -Ey+w4p+p0.3p,black -Ss0.2c -W0.3p -Gred

    @REM Van der Woerd et al.(2002)
    @REM echo 94.54280395522568  10.836012861736334 0.93 | gmt plot -Ey+w4p+p0.3p,black -Ss0.2c -W0.3p -G15/184/34
    @REM echo 94.91845369049634  11.067524115755628 1.97 | gmt plot -Ey+w4p+p0.3p,black -Ss0.2c -W0.3p -G15/184/34
    @REM echo 95.49075260498513  10.372990353697748 1.5  | gmt plot -Ey+w4p+p0.3p,black -Ss0.2c -W0.3p -G15/184/34
    @REM echo 99.49234823392887  9.09967845659164 2.93   | gmt plot -Ey+w4p+p0.3p,black -Ss0.2c -W0.3p -G15/184/34
    @REM echo 99.82211154896888  9.94855305466238 0.85   | gmt plot -Ey+w4p+p0.3p,black -Ss0.2c -W0.3p -G15/184/34
    @REM echo 99.82496434011072  7.672025723472668 1.16  | gmt plot -Ey+w4p+p0.3p,black -Ss0.2c -W0.3p -G15/184/34
    @REM echo 100.48231511254019 11.106109324758842 1.85 | gmt plot -Ey+w4p+p0.3p,black -Ss0.2c -W0.3p -G15/184/34

    echo 94.5204872646733 11.89723320158103 1      | gmt plot -Ey+w4p+p0.3p,black -Ss0.2c -W0.3p -G15/184/34
    echo 94.8781838316722 12.063241106719369 2.65  | gmt plot -Ey+w4p+p0.3p,black -Ss0.2c -W0.3p -G15/184/34
    echo 95.2358803986711 10.790513833992097 1.55  | gmt plot -Ey+w4p+p0.3p,black -Ss0.2c -W0.3p -G15/184/34
    echo 99.12846068660022 10.292490118577076 2.88 | gmt plot -Ey+w4p+p0.3p,black -Ss0.2c -W0.3p -G15/184/34
    echo 99.27574750830564 8.853754940711463 0.72  | gmt plot -Ey+w4p+p0.3p,black -Ss0.2c -W0.3p -G15/184/34
    echo 99.296788482835 10.845849802371543 0.5    | gmt plot -Ey+w4p+p0.3p,black -Ss0.2c -W0.3p -G15/184/34
    echo 100.55924695459579 12.49 2.5              | gmt plot -Ey+w4p+p0.3p,black -Ss0.2c -W0.3p -G15/184/34

    @REM Kirby et al.(2007)
    echo 101.2871406812852  4.85530546623794 0.85   | gmt plot -Ey+w4p+p0.3p,black -St0.2c -W0.3p -G213/93/172
    echo 102.28329666610256 1.9228295819935681 0.81 | gmt plot -Ey+w4p+p0.3p,black -St0.2c -W0.3p -G213/93/172

    @REM Harkins et al. (2010)
    echo 99.54928017718714 6.147465437788018 1.27   | gmt plot -Ey+w4p+p0.3p,black -Si0.2c -W0.3p -Gred
    echo 100.62236987818383 3.7695852534562206 1.93 | gmt plot -Ey+w4p+p0.3p,black -Si0.2c -W0.3p -Gred
    echo 101.08527131782945 4.488479262672808 1.82  | gmt plot -Ey+w4p+p0.3p,black -Si0.2c -W0.3p -Gred
    echo 101.50609080841639 3.493087557603685 0.94  | gmt plot -Ey+w4p+p0.3p,black -Si0.2c -W0.3p -Gred

    echo N 1                                                            > legend.txt
    echo T Geodetic slip rates:                                        >> legend.txt
    echo G 0.3c                                                        >> legend.txt

    echo N 3                                                           >> legend.txt
    echo S 0.3c y 0.2c - 4p,33/80/160 0.5c Kirby et al.(2007)          >> legend.txt
    echo S 0.3c y 0.2c - 4p,yellow 0.5c Duvall and Clark.(2010)        >> legend.txt
    echo S 0.3c y 0.2c - 4p,green 0.5c Garthwaite et al.(2013)         >> legend.txt
    echo S 0.3c y 0.2c - 4p,purple 0.5c Zheng et al.(2017)             >> legend.txt
    echo S 0.3c y 0.2c - 4p,red 0.5c Diao et al.(2019)                 >> legend.txt
    echo S 0.3c y 0.2c - 4p,252/190/203 0.5c Wang and Shen.(2019)      >> legend.txt
    echo S 0.3c y 0.2c - 4p,242/166/1 0.5c Zhao et al.(2022)           >> legend.txt

    echo N 1                                                           >> legend.txt
    echo G 0.1c                                                        >> legend.txt
    echo T Geological slip rates:                                      >> legend.txt
    echo G 0.3c                                                        >> legend.txt

    echo N 3                                                           >> legend.txt
    echo S 0.3c s 0.2c 15/184/34 0.25p 0.5c Van der Woerd et al.(2002) >> legend.txt
    echo S 0.3c c 0.15c 26/168/214 0.25p 0.5c Li et al.(2005)          >> legend.txt

    echo S 0.3c c 0.15c red 0.25p 0.5c Guo et al.(2007)                >> legend.txt
    echo S 0.3c t 0.2c 213/93/172 0.25p 0.5c Kirby et al.(2007)        >> legend.txt
    echo S 0.3c s 0.2c red 0.25p 0.5c Lin et al.(2008)                 >> legend.txt
    echo S 0.3c i 0.2c red 0.25p 0.5c Harkins et al. (2010)            >> legend.txt

    gmt legend legend.txt -Dx0.01c/-2.9c+w8c/2.1c+jBL -F+p0.3p --FONT_ANNOT_PRIMARY=6p,4

gmt end
del gmt.*,legend.txt,tmp*
