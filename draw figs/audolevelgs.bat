@echo off
:�����ӳٱ���
setlocal EnableDelayedExpansion
pushd D:\Jianglizhi\datafiles\or
for /l %%i in (1,1,29) do (
@echo %%i
set out=HGTlev%%i.gs
set outgrd=HGTlev%%i.grd
echo !out! !outgrd!
if exist !out! (del !out!) else (echo "there is no file , create it!")
rem ���濪ʼ��дGS�ļ�... !out!

echo 'reinit' >> !out!
echo 'open  D:\Jianglizhi\datafiles\or\oth\pgbh00.gdas.198709.ctl' >>!out!
echo 'set fwrite D:\Jianglizhi\datafiles\or\!outgrd!' >>!out!
echo 'set gxout fwrite' >>!out!

echo *���û�ͼ����>> !out!
echo 'set lat 27 35'>> !out!
echo 'set lon 102 111'>> !out!
echo 'set z %%i'>> !out!
echo 'set t 1 120'>> !out!
echo 'd HGTprs'>> !out!
echo 'disable fwrite'>> !out!
echo ; >> !out!
echo 'quit' >> !out!
)
pause