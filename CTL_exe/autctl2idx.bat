cd /d %~dp0
@echo off
rem �˳������ڴ���NECP FNL���ϣ�������.ctl��.idx�ļ���Ȼ��ʹ��grads��ͼ
:�����ӳٱ���
setlocal EnableDelayedExpansion
for /r  %%j in (*.ctl) do (
set var=%%j
echo -----------------------------------------------------------------------
echo ��������.idx�����ļ������Ժ�...
gribmap.exe -i !var!
  
)
pause