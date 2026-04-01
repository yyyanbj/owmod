#!/bin/bash

# OW Workshop 小游戏合集 - 同步脚本
# 从源项目同步 visual-companion.html 到合集网站

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SSWD_SRC="$HOME/workspace/ow-sswd/docs/visual-companion.html"
LTK_SRC="$HOME/workspace/ow-ltk/visual-companion.html"

SSWD_DST="$SCRIPT_DIR/sswd/index.html"
LTK_DST="$SCRIPT_DIR/ltk/index.html"

echo "🔄 开始同步游戏文件..."

# 同步 OW 三国杀
if [ -f "$SSWD_SRC" ]; then
    cp "$SSWD_SRC" "$SSWD_DST"
    echo "✅ 已同步：OW 三国杀 -> sswd/index.html"
else
    echo "❌ 警告：未找到源文件 $SSWD_SRC"
fi

# 同步 OW LTK
if [ -f "$LTK_SRC" ]; then
    cp "$LTK_SRC" "$LTK_DST"
    echo "✅ 已同步：OW LTK -> ltk/index.html"
else
    echo "❌ 警告：未找到源文件 $LTK_SRC"
fi

echo "🎉 同步完成！"
