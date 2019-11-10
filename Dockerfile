FROM openjdk:13-windowsservercore
CMD ["powershell"]
ADD https://www.python.org/ftp/python/2.6.5/python-2.6.5.msi /
ADD http://www.ccfinder.net/download/ccfx-win32-en.zip /
RUN msiexec /quiet /i python-2.6.5.msi /norestart ADDLOCAL=ALL; Remove-Item python-2.6.5.msi; setx /m PATH $($Env:PATH +';C:\Python26'); mkdir ccfx; Expand-Archive -Path ccfx-win32-en.zip /; mv ccfx-win32-en 10.2.7.4; Copy-Item -Recurse 10.2.7.4 ./ccfx/; Remove-Item ccfx-win32-en.zip; Remove-Item -Recurse 10.2.7.4; mkdir projects;
