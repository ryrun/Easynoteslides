@echo off
del /F /Q out/toimp.ryrun.Easynoteslides.xrnx
"C:\Program Files\7-Zip\7z" a -tzip out/toimp.ryrun.Easynoteslides.xrnx main.lua manifest.xml 
