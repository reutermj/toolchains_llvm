@echo off

REM Remove "-fPIC" from the args
set "newArgs="
for %%A in (%*) do (
    if "%%~A" neq "-fPIC" (
        set "newArgs=!newArgs! %%~A"
    )
)

%{toolchain_path_prefix}bin\clang.exe %newArgs%