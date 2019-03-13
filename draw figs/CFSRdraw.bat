cd /d %~dp0
@echo off
rem 此程序用于处理NECP CFSR资料，并生成.ctl和.idx文件，然后使用grads绘图
:开启延迟变量
setlocal EnableDelayedExpansion
for /r  %%j in (*.grb2) do (
set var=%%j
set var=!var:~0,-4!ctl
echo -----------------------------------------------------------------------------------
echo 正在生成.ctl文件,Please wait ...
g2ctl.exe %%j > !var!
echo -----------------------------------------------------------------------
echo 正在生成.idx索引文件，请稍后...
gribmap.exe -i !var!
echo ----------------------------------------------------------------------------------------
echo 下面开始编写GS文件...
set vbr=%%j
set vbr=!vbr:~0,-4!gs
echo !vbr!
if exist !vbr! (del !vbr!) else (echo sorry!there is no file)
echo 'reinit' >> !vbr!
echo 'open !var!' >>!vbr!
echo 'set grads off' >>!vbr!
echo 'set grid on' >>!vbr!
echo 'set gxout contour' >>!vbr!
echo *自定义颜色>> !vbr!
echo 'set rgb 16  51 255   0'>> !vbr!
echo 'set rgb 17 255 153   0'>> !vbr!
echo 'set rgb 18 255   0   0'>> !vbr!
echo 'set rgb 19 255 102 153'>> !vbr!
echo 'set rgb 20 102   0 102'>> !vbr!
echo 'set rgb 21 51    0  51'>> !vbr!
echo *设置绘图区域>> !vbr!
echo 'set lat 10 70'>> !vbr!
echo 'set lon 20 150'>> !vbr!
echo 'set lev 500'>> !vbr!
echo *设置等值线>> !vbr!
echo 'set cterp on'>> !vbr!
echo 'set csmooth on'>> !vbr!
echo 'set clevs 520 524 528 532 536 540 544 548 552 556 560 564 568 572 576 580 584 588 592'>> !vbr!
echo 'set ccolor 18'>> !vbr!
echo 'set cmin 4'>> !vbr!
echo 'd HGTprs/10'>> !vbr!
echo 'set gxout barb'>> !vbr!
echo 'd skip(UGRdprs,3^);skip(VGRdprs,3^)' >> !vbr!
echo *设置地图>> !vbr!
echo 'set mpdset cnriver'          >> !vbr!
echo 'set map 4 1 15'              >> !vbr!
echo 'draw map'                    >> !vbr!
echo 'set mpdset cnworld'          >> !vbr!
echo 'set map 15 1 5'              >> !vbr!
echo 'draw map'                    >> !vbr!
echo 'set mpdset xinj'         >> !vbr!
echo 'set map 14 1 7'              >> !vbr!
echo 'draw map'                    >> !vbr!
echo 'set mproj scaled'            >> !vbr!
echo 'set mpdset cnworld'          >> !vbr!
echo 'draw title 2007/07/18 02:00(BJT^) 500hPa HGT'             >> !vbr!
set vcr=hgt_wind!var:~-14,-4!.png @文件名
echo 'printim !vcr! white x1000 y800'         >> !vbr!
echo 'quit';                  >> !vbr!  
echo --------------------------------------------------------------------------------
echo 正在绘图，马上完成，请稍等....
set grads=C:\OpenGrADS\Contents\Cygwin\Versions\2.0.a7.oga.3\i686\grads
echo !grads!
!grads! -cl !vbr!
)
pause
