@echo off
rem 此程序用于处理NECP FNL资料，并生成.ctl和.idx文件，然后使用grads绘图
rem 此程序使用的为Grads2.0
echo 正在生成.ctl文件,Please wait ...
rem -----------------------------------------------------------------------------------
pushd d:\
cd D:\OpenGrADS\Contents\Cygwin\Versions\2.0.a7.oga.3\i686\
g2ctl e:\fnl\fnl201101010000 > e:\fnl\fnl201101010000.ctl
set f=e:\fnl\
set n=fnl201101010000
set g=.ctl
rem --------------------------------------------------------------------------------------
echo 正在生成.idx索引文件，请稍后...
pushd d:\
cd D:\OpenGrADS\Contents\Cygwin\Versions\2.0.a7.oga.3\i686\
gribmap -i e:\fnl\fnl201101010000.ctl
rem ---------------------------------------------------------------------------------------
pushd e:\fnl\
if exist e:\fnl\fnl_500hpa.gs (del e:\fnl\fnl_500hpa.gs) else (echo sorry!there is no file)
rem ----------------------------------------------------------------------------------------
rem 下面开始编写GS文件...

echo 'reinit' >> fnl_500hpa.gs
echo 'open %f%%n%%g% ' >>e:\fnl\fnl_500hpa.gs
echo 'set grads off' >>e:\fnl\fnl_500hpa.gs
echo 'set grid on' >>e:\fnl\fnl_500hpa.gs
echo 'set gxout contour' >>e:\fnl\fnl_500hpa.gs
echo *自定义颜色>> fnl_500hpa.gs
echo 'set rgb 16  51 255   0'>> fnl_500hpa.gs
echo 'set rgb 17 255 153   0'>> fnl_500hpa.gs
echo 'set rgb 18 255   0   0'>> fnl_500hpa.gs
echo 'set rgb 19 255 102 153'>> fnl_500hpa.gs
echo 'set rgb 20 102   0 102'>> fnl_500hpa.gs
echo 'set rgb 21 51    0  51'>> fnl_500hpa.gs
echo *设置绘图区域>> fnl_500hpa.gs
echo 'set lat 10 70'>> fnl_500hpa.gs
echo 'set lon 20 150'>> fnl_500hpa.gs
echo 'set lev 500'>> fnl_500hpa.gs

echo *设置等值线>> fnl_500hpa.gs
echo *echo 'setcterp on'>> fnl_500hpa.gs
echo *echo 'setcsmooth on'>> fnl_500hpa.gs
echo 'set clevs 520 524 528 532 536 540 544 548 552 556 560 564 568 572 576 580 584 588 592'>> fnl_500hpa.gs
echo *'set ccolor 18'>> fnl_500hpa.gs
echo 'set cmin 4'>> fnl_500hpa.gs
echo 'd HGTprs/10'>> fnl_500hpa.gs
echo 'set gxout barb'>> fnl_500hpa.gs
echo 'd skip(UGRdprs,3);skip(VGRdprs,3)'>> fnl_500hpa.gs

echo *设置地图>> fnl_500hpa.gs
echo 'set mpdset cnriver'          >> fnl_500hpa.gs
echo 'set map 4 1 15'              >> fnl_500hpa.gs
echo 'draw map'                    >> fnl_500hpa.gs
echo 'set mpdset cnworld'          >> fnl_500hpa.gs
echo 'set map 15 1 5'              >> fnl_500hpa.gs
echo 'draw map'                    >> fnl_500hpa.gs
echo 'set mpdset xinjiang'         >> fnl_500hpa.gs
echo 'set map 14 1 7'              >> fnl_500hpa.gs
echo 'draw map'                    >> fnl_500hpa.gs
echo 'set mproj scaled'            >> fnl_500hpa.gs
echo 'set mpdset cnworld'          >> fnl_500hpa.gs
echo *'draw title 2007/07/18 02:00(BJT) 500hPa HGT'             >> fnl_500hpa.gs
echo 'printim %f%%n%UTC_hgt_wind.png white x1000 y800'         >> fnl_500hpa.gs
echo ;                                                         >> fnl_500hpa.gs
rem --------------------------------------------------------------------------------
echo 正在绘图，马上完成，请稍等....
pushd d:\
cd D:\OpenGrADS\Contents\Cygwin\Versions\2.0.a7.oga.3\i686\
rem D:\OpenGrADS\Contents\Cygwin\Versions\2.0.a7.oga.3\i686\grads -cl e:\fnl\fnl_500hpa_hgt_wind.gs
D:\OpenGrADS\Contents\Cygwin\Versions\2.0.a7.oga.3\i686\grads -cl e:\fnl\fnl_500hpa.gs
