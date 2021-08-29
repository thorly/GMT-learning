gmt begin f png
    gmt basemap -JX10c -R0/20/0/20 -Ba5f2.5g2.5 -BWSne
    echo 1 255/0/0 2 255/0/0 > t.cpt
    echo 2 0/255/0 3 0/255/0 >> t.cpt
    echo 10 10 1.5 2 | gmt plot -Sc -Ct.cpt
    echo 3 3 2.5 1 | gmt plot -Sc -Ct.cpt
    gmt colorbar -DjBR+o-0.9c/0.0c+w10c/0.5c -Ct.cpt
gmt end
del gmt.*