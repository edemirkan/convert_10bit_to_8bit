:: Convert 10 bit video to 8 bit
:: 05/06/2016 evren demirkan
@echo off
::net use K: \\network-location\share REM If your content is on a network share.. 
set "eight_bit_path=C:\Destination\path\to\your\8bit video\"
set anime_full_path=%~dp1
set temp=%anime_full_path:~0,-1%
for %%f in ("%temp%") do set anime_name=%%~nxf
set "new_path=%eight_bit_path%%anime_name%"
md "%new_path%"

%~dp0ffmpeg.exe -y -i %1 -map 0 -c copy -c:v nvenc_h264 -preset medium -threads 4 -stats -loglevel error -pix_fmt nv12 "%new_path%\%~n1.8bit%~x1"
::net use /delete K: REM Disconnect share after conversion
