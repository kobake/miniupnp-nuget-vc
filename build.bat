@echo.
@echo "==============================="
@echo "clean packaging output files"
@echo "==============================="

del packaging\x86_debug\*.lib
del packaging\x86_release\*.lib
del packaging\x86_include\*.h
del packaging\x86_include\miniupnpc\*.h

del packaging\x64_debug\*.lib
del packaging\x64_release\*.lib
del packaging\x64_include\*.h
del packaging\x64_include\miniupnpc\*.h


@echo.
@echo "==============================="
@echo "x86"
@echo "==============================="

setlocal
pushd miniupnp\miniupnpc
rmdir /S /Q cmake-make32
mkdir cmake-make32
pushd cmake-make32

CALL "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars32.bat"

cmake -G "Visual Studio 16 2019" -A Win32 -DUPNPC_BUILD_TESTS=FALSE ..
msbuild upnpc-static.vcxproj -p:Configuration=Debug   -p:Platform=Win32
msbuild upnpc-static.vcxproj -p:Configuration=Release -p:Platform=Win32

xcopy Debug\*.lib    ..\..\..\packaging\x86_debug\.
xcopy Release\*.lib  ..\..\..\packaging\x86_release\.
xcopy *.h            ..\..\..\packaging\x86_include\miniupnpc\.

popd
popd
endlocal
@echo.


@echo.
@echo "==============================="
@echo "x64"
@echo "==============================="

setlocal
pushd miniupnp\miniupnpc
rmdir /S /Q cmake-make64
mkdir cmake-make64
pushd cmake-make64

CALL "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat"

cmake -G "Visual Studio 16 2019" -A x64 -DUPNPC_BUILD_TESTS=FALSE ..
msbuild upnpc-static.vcxproj -p:Configuration=Debug   -p:Platform=x64
msbuild upnpc-static.vcxproj -p:Configuration=Release -p:Platform=x64

xcopy Debug\*.lib    ..\..\..\packaging\x64_debug\.
xcopy Release\*.lib  ..\..\..\packaging\x64_release\.
xcopy *.h            ..\..\..\packaging\x64_include\miniupnpc\.

popd
popd
endlocal
@echo.
