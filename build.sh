#!/bin/bash
cd vue
npm run build
cd ..
mvn clean package
scp ./target/*.jar root@服务器IP:/服务器资源存放地址",
