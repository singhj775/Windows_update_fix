rem windows update fix
rem taken from http://www.akaplan.com/blog/wp-content/uploads/2011/11/WindowsUpdateFix_cmd.txt

ipconfig /flushdns
Cd /d %windir% 
del /s *.chk;*.rip;*.tmp;~*.*
msiexec /regserver
sc config msiserver start= auto
net stop msiserver
msiexec /unreg
msiexec /regserver
regsvr32 msi.dll /s
regsvr32 msihnd.dll /s
net start msiserver
Regsvr32 wuaueng.dll /s
net stop wuauserv 
cd /d %windir%
rmdir /s /q  softwaredistribution
net start wuauserv
sc config eventlog start= auto obj= Localsystem
net start eventlog
regsvr32 qmgr.dll /s
regsvr32 qmgrprxy.dll /s
sc sdset bits D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;AU)(A;;CCLCSWRPWPDTLOCRRC;;;PU)
regsvr32 wuaueng.dll /s
sc sdset wuauserv D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;AU)(A;;CCLCSWRPWPDTLOCRRC;;;PU)
sc config wuauserv start= auto obj= Localsystem
net stop wuauserv
sc config bits start= DEMAND obj= Localsystem
net stop bits
regsvr32 msxml.dll /s
regsvr32 msxml2.dll /s
regsvr32 msxml3.dll /s
regsvr32 msxml4.dll /s
regsvr32 qmgr.dll /s
regsvr32 qmgrprxy.dll /s
regsvr32 muweb.dll /s
regsvr32 winhttp.dll /s
regsvr32 wuapi.dll /s
regsvr32 wuaueng.dll /s
regsvr32 wuaueng1.dll /s
regsvr32 wucltui.dll /s
regsvr32 wups.dll /s
regsvr32 wups2.dll /s
regsvr32 wuweb.dll /s
net start wuauserv
net start bits
sc config cryptsvc start= auto
net stop cryptsvc
cd %windir%\system32\catroot2
del *.* /f/q/s
regsvr32 cryptdlg.dll /s
regsvr32 cryptui.dll /s
regsvr32 dssenh.dll /s
regsvr32 gpkcsp.dll /s
regsvr32 initpki.dll /s
regsvr32 mssip32.dll /s
regsvr32 sccbase.dll /s
regsvr32 softpub.dll /s
regsvr32 slbcsp.dll /s
regsvr32 rsaenh.dll /s
regsvr32 winhttp.dll /s
regsvr32 wintrust.dll /s
net start cryptsvc
cd\
sc config ose start= demand
net start ose
regsvr32 qmgr.dll /s
regsvr32 qmgrprxy.dll /s
regsvr32 es.dll /s
cls
Rem **************End of the process*****************
pause
exit
