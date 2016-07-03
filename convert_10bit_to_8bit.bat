:: Convert 10 bit video to 8 bit
:: 05/06/2016 evren demirkan
@echo off
net use K: \\192.168.0.7\media\seagate_2.0tb 
set "eight_bit_path=K:\anime\series.10bit_to_8bit_converted\"
set anime_full_path=%~dp1
set temp=%anime_full_path:~0,-1%
for %%f in ("%temp%") do set anime_name=%%~nxf
set "new_path=%eight_bit_path%%anime_name%"
md "%new_path%"

%~dp0ffmpeg.exe -y -i %1 -map 0 -c copy -c:v nvenc_h264 -preset medium -threads 4 -stats -loglevel error -pix_fmt nv12 "%new_path%\%~n1.8bit%~x1"
net use /delete K:
