del /f pack-all-login.js
for /f %%i in (pack-list-js-login.txt) do  type %%i >> pack-all-login.js 

java -jar yuicompressor-2.4.8.jar --type js --charset utf-8 pack-all-login.js -o pack-all-min-login.js