@echo off
chcp 65001 >nul
title 模型压缩工具 - 钢结构构件系统
echo ============================================
echo    3D模型一键压缩工具
echo    把要压缩的 .glb 文件拖到这个窗口里
echo ============================================
echo.
set /p input="请把 .glb 文件拖到这里然后按回车: "

REM 去掉可能的引号和空格
set input=%input:"=%
set input=%input: =%

REM 提取文件名和路径
for %%F in ("%input%") do (
    set filepath=%%~dpF
    set filename=%%~nxF
    set name=%%~nF
)

echo.
echo 正在压缩: %filename%
echo 请稍等...
echo.

cd /d "%filepath%"
npx --yes @gltf-transform/cli@latest optimize "%filename%" "%name%.min.glb" --compress draco --texture-compress webp

echo.
echo ============================================
echo  压缩完成!
echo  生成文件: %name%.min.glb
echo  位置: %filepath%
echo ============================================
echo.
pause