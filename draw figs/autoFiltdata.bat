@echo off
:¿ªÆôÑÓ³Ù±äÁ¿
setlocal EnableDelayedExpansion
set var=abc
for /r  %%j in (*.grb2) do (
set in=%%j
set out=!in:~0,-4!grd
echo !in!
echo !out!
wgrib2 !in! | grep ":HGT_P0_L100_GLL0:" | wgrib2 -i !in! -bin dump
wgrib2 -bin !out! !in!
 

)
pause

"ncks -v HGT_P0_L100_GLL0 -d lon,340.,50. -d lat,10.,35. !in! !out!"
"H   =f->HGT_P0_L100_GLL0({50000},{-30:30},{0:90})"
"wgrib2 -match ":HGT_P0_L100_GLL0:" !in! -bin !out! "