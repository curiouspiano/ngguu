@ECHO OFF
rem Author: Marius Silaghi, 2019
SET FILEBASE=%~n1
echo Handling Source: %FILEBASE%
setlocal

rem You may use quotes only once, for the whole parameter
set "PATH=C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.24.28314\bin\HostX86\x86;C:\Program Files (x86)\Windows Kits\10\bin\10.0.18362.0\x86;;C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\tools;C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\ide;C:\Program Files (x86)\HTML Help Workshop;;C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\MSBuild\Current\Bin;C:\Windows\Microsoft.NET\Framework\v4.0.30319\;;C:\Python38\Scripts\;C:\Python38\;C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\Windows\System32\OpenSSH\;C:\ProgramData\chocolatey\bin;C:\Program Files\Git\cmd;C:\Program Files\NVIDIA Corporation\NVIDIA NvDLISR;C:\Program Files (x86)\NVIDIA Corporation\PhysX\Common;C:\Program Files\dotnet\;C:\Users\mikew\AppData\Local\Microsoft\WindowsApps;"

set "LIB=C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.24.28314\lib\x86;C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.24.28314\atlmfc\lib\x86;;C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\VS\lib\x86;;C:\Program Files (x86)\Windows Kits\10\lib\10.0.18362.0\ucrt\x86;;;C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\VS\UnitTest\lib;C:\Program Files (x86)\Windows Kits\10\lib\10.0.18362.0\um\x86;C:\Program Files (x86)\Windows Kits\NETFXSDK\4.8\lib\um\x86;;Lib\um\x86"

set "LIBPATH=C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.24.28314\atlmfc\lib\x86;C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.24.28314\lib\x86;"

set "INCLUDE=C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.24.28314\include;C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Tools\MSVC\14.24.28314\atlmfc\include;;C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\VS\include;;C:\Program Files (x86)\Windows Kits\10\Include\10.0.18362.0\ucrt;;;C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\VS\UnitTest\include;C:\Program Files (x86)\Windows Kits\10\Include\10.0.18362.0\um;C:\Program Files (x86)\Windows Kits\10\Include\10.0.18362.0\shared;C:\Program Files (x86)\Windows Kits\10\Include\10.0.18362.0\winrt;C:\Program Files (x86)\Windows Kits\10\Include\10.0.18362.0\cppwinrt;C:\Program Files (x86)\Windows Kits\NETFXSDK\4.8\Include\um;"


rem ml.exe /c /nologo /Sg /Zi /Fo"%FILEBASE%.obj" /Fl"%FILEBASE%.lst" /I "c:\Irvine" /W3 /errorReport:prompt /Ta%FILEBASE%.asm

FOR %%F IN (%*) DO (
echo Handling %%~nF
ml.exe /c /nologo /Sg /Zi /Fo"%%~nF.obj" /Fl"%%~nF.lst" /I "c:\Irvine" /W3 /errorReport:prompt /Ta%%~nF.asm
)

link /ERRORREPORT:PROMPT /OUT:"C:\Users\mikew\Documents\~Programming\Arch\Project32_VS2015\Project32_VS2015\Debug\Project.exe" /NOLOGO /LIBPATH:c:\Irvine user32.lib irvine32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /MANIFEST /MANIFESTUAC:"level='asInvoker' uiAccess='false'" /manifest:embed /DEBUG /PDB:"C:\Users\mikew\Documents\~Programming\Arch\Project32_VS2015\Project32_VS2015\Debug\Project.pdb" /SUBSYSTEM:CONSOLE /TLBID:1 /DYNAMICBASE:NO /IMPLIB:"C:\Users\mikew\Documents\~Programming\Arch\Project32_VS2015\Project32_VS2015\Debug\Project.lib" /MACHINE:X86 /SAFESEH:NO Debug\AddTwo.obj

endlocal

