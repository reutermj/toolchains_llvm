@echo off

REM Remove "-fPIC" from the args
set "newArgs="
for %%A in (%*) do (
    if "%%~A" neq "-fPIC" (
        set "newArgs=!newArgs! %%~A"
    )
)

setlocal enabledelayedexpansion
echo Arguments without -fPIC: !newArgs!

%{toolchain_path_prefix}bin\clang.exe !newArgs!