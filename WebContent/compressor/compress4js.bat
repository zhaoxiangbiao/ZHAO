del /f pack-all.js
for /f %%i in (pack-list-js.txt) do  type %%i >> pack-all.js 

java -jar yuicompressor-2.4.8.jar --type js --charset utf-8 pack-all.js -o pack-all-min.js