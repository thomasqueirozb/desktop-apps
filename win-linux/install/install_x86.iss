#include "common.iss"


[Setup]
AppName                 ={cm:AppName}
AppVersion              ={#sAppVersion}
OutputBaseFileName      =DesktopEditors_x86
MinVersion              =0,5.0.2195
;ArchitecturesAllowed    =x86


[Files]
Source: data\vcredist\vcredist_x86.exe;       DestDir: {app}\; Flags: deleteafterinstall; \
    AfterInstall: installVCRedist(ExpandConstant('{app}\vcredist_x86.exe'), ExpandConstant('{cm:InstallAdditionalComponents}')); Check: not checkVCRedist;

Source: ..\build\Release\release\DesktopEditors.exe;     DestDir: {app}; 

Source: ..\..\common\converter\windows\win32\*;           DestDir: {app}\converter; Flags: recursesubdirs ignoreversion;
Source: ..\..\common\libs\ChromiumBasedEditors2\app\corebuilds\win32\ascdocumentscore.dll;  DestDir: {app}\; Flags: ignoreversion;
Source: ..\..\common\libs\ChromiumBasedEditors2\app\cefbuilds\win32\*;                      DestDir: {app}\; Excludes: *.lib; Flags: ignoreversion recursesubdirs;
Source: data\libs\qt\win32\*;                             DestDir: {app}\; Flags: ignoreversion recursesubdirs;
Source: data\libs\chromium\win_xp\dbghelp.dll;            DestDir: {app}\; Flags: onlyifdoesntexist; OnlyBelowVersion: 6.0;
Source: data\libs\chromium\win32\dbghelp.dll;             DestDir: {app}\; Flags: onlyifdoesntexist; MinVersion: 6.0; Check: libExists('dbghelp.dll');


