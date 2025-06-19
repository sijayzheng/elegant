#!/bin/bash
cd vue
npm run build
cd ..
mvn clean package
scp ./target/*.jar root@服务器IP:/服务器资源存放地址

JAR_NAME=elegant.jar
cd vue
pnpm run build
cd ..
mvn clean package #-Pprod
cp target/${JAR_NAME} prod
cd prod
if [ ! -f "$JAR_NAME" ]; then
  echo "错误: 文件 $JAR_NAME 不存在"
  exit 1
fi

echo "正在分析模块依赖..."
MODULES=$(jdeps --ignore-missing-deps -q --print-module-deps "$JAR_NAME")

if [ -z "$MODULES" ]; then
  echo "警告: 未检测到模块依赖，使用默认模块 java.base"
  MODULES="java.base"
fi

echo "检测到必需模块: $MODULES"

MODULES_RELEASE=$(awk -F= '/^MODULES=/ { gsub(/"/, "", $2); print $2 }' jre/release)

# 安全写法示例
if [ "${MODULES}" != "${MODULES_RELEASE}" ]; then
   echo "安全比较完成！"
  OUTPUT_DIR="jre"
  rm -rf $OUTPUT_DIR
  echo "正在构建最小 JRE (输出目录: $OUTPUT_DIR)..."

  wsl jlink \
    --add-modules "$MODULES" \
    --strip-debug \
    --no-man-pages \
    --no-header-files \
    --compress=2 \
    --output "$OUTPUT_DIR"

  # 验证结果
  if [ $? -eq 0 ]; then
    du -sh "$OUTPUT_DIR"
    echo -e "\n构建成功！"
  else
    echo -e "\n构建失败，请检查错误信息"
  fi
fi

