gmt set FONT_HEADING 24p,4
gmt set FONT_ANNOT_PRIMARY 12p,4
gmt set FONT_LABEL 14p,4

gmt begin fit png A0.2c
	gmt subplot begin 5x1 -Fs6i/1.9i -M1c/1c/0c/1c -A"A"+jTR+p1p+gwhite+o0.5c/0.5c -R-200/200/-9000/2000 -Bxaf -Byaf+u" m" -BWSne+gazure1 -T"The Yap Trench"
	
        gmt subplot set 4
        gmt plot envYT1.txt -W0.5p -Glightgray -Byafg1000 -Bxafg100
        gmt plot avg_test.txt -W0.5p,red

		# Basic LS line y = a + bx
		gmt subplot set 3
		gmt trend1d -Fxm avg_test.txt -Np1 > model.txt
		gmt plot -Sc0.05c -Gred avg_test.txt -Byafg1000 -Bxafg100
		gmt plot -W0.5p,blue model.txt
		gmt text -F+f12p+cTL+t"m@-2@-(t) = a + b\267t" -Dj0.1i -Glightyellow

		# Basic LS line y = a + bx + cx^2
		gmt subplot set 2
		gmt trend1d -Fxm avg_test.txt -Np2 > model.txt
		gmt plot -Sc0.05c -Gred avg_test.txt -Byafg1000 -Bxafg100
		gmt plot -W0.5p,blue model.txt
		gmt text -F+f12p+cTL+t"m@-3@-(t) = a + b\267t + c\267t@+2@+" -Dj0.1i -Glightyellow

		# Basic LS line y = a + bx + cx^2 + seasonal change
		gmt subplot set 1
		gmt trend1d -Fxmr avg_test.txt -Np2,f1 > model.txt
		gmt plot -Sc0.05c -Gred avg_test.txt -Byafg1000 -Bxafg100
		gmt plot -W0.25p,blue model.txt
		gmt text -F+f12p+cTL+t"m@-5@-(t) = a + b\267t + c\267t@+2@+ + d\267cos(2@~p@~t) + e\267sin(2@~p@~t)" -Dj0.1i -Glightyellow

		# Plot residuals of last model
		gmt subplot set 0
		gmt plot -R-200/200/-3000/2500 -Bxaf+l"Distance (km)" -Bxafg100 -Byafg1000+u" m"+l"Depth (m)" -Sc0.05c -Gred model.txt -i0,2
		gmt text -F+f12p+cTL+t"@~e@~(t) = y(t) - m@-5@-(t)" -Dj0.1i -Glightyellow

	gmt subplot end
gmt end
rm -rf gmt.*