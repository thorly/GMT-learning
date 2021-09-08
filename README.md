# GMT-learning

0. [GMT中文手册](https://docs.gmt-china.org/6.2/)（多查阅,见多识广）

1. [配置中文支持](https://docs.gmt-china.org/6.2/chinese/windows/)（不再依赖CorelDRAW😉）

2. [配置中科大服务器](https://docs.gmt-china.org/latest/conf/misc/)（为了更快地下载GMT官方提供的地形等数据）

3. 学会使用`gdal`、`gawk`等工具
    ```bash
    # 投影变换 EPSG:4326 WGS84
    gdalwarp -t_srs EPSG:4326 input.tif output.tif
    # shp2gmt（GMT也可直接使用shp文件）
    ogr2ogr -f OGR_GMT -t_srs EPSG:4326 gadm36_CHN_0.gmt gadm36_CHN_0.shp
    # 数据转换（gdal_translate --long-usage）
    gdal_translate -of GTiff input.grd output.tif
    # 拼接
    gdalwarp input1.tif input2.tif merged.tif
    gdal_merge.py -o merged.tif input1.tif input2.tif
    # 裁剪
    gdalwarp -te <x_min> <y_min> <x_max> <y_max> input.tif clipped_output.tif
    # 筛选数据（Windows下可安装gawk软件）
    gawk "{if ($17>0 && $17<=1) print $3,$2,$17,$4}" t1 > 0-1.txt
    ```

4. 不要依赖`Surfer`等软件制作grd文件，对于规则的xyz文件可以使用GMT内置模块`xyz2grd`制作，不规则数据可以使用`surface`制作

5. [使用VScode编写脚本并绘图](https://gmt-china.org/blog/vscode-usage/)（画图成了一种享受😁）

6. 在中文已经设置好的前提下，某些字乱码或者不显示（`gmt set PS_CHAR_ENCODING Standard+`）

7. 绘图设定范围时，可以直接使用`-Rtt.grd`

8. 查看所有参数（`gmt defaults -D`）、查看字体（`gmt text -L`）、查看模块文档（`gmt 模块名称`）

9. `plot`模块可以直接使用shp文件，`grdimage`可以直接使用tif文件

10. [特殊字符](https://docs.gmt-china.org/6.2/basis/special-character/)

11. [转义字符](https://docs.gmt-china.org/6.2/basis/escape-character/)(实现上标、下标等功能，并可以在一个字符串内随意切换字体、字号和颜色)

12. [自定义符号](https://docs.gmt-china.org/latest/module/plot/#gmt)