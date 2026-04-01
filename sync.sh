#!/bin/bash

# OW Workshop 小游戏合集 - 同步脚本
# 从源项目同步 visual-companion.html 到合集网站

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SGS_SRC="$HOME/workspace/ow-sswd/docs/visual-companion.html"
WDSD_SRC="$HOME/workspace/ow-ltk/visual-companion.html"

SGS_DST="$SCRIPT_DIR/sgs/index.html"
WDSD_DST="$SCRIPT_DIR/wdsd/index.html"

echo "🔄 开始同步游戏文件..."

# 同步 OW 三国杀
if [ -f "$SGS_SRC" ]; then
    cp "$SGS_SRC" "$SGS_DST"
    echo "✅ 已同步：OW 三国杀 -> sgs/index.html"
else
    echo "❌ 警告：未找到源文件 $SGS_SRC"
fi

# 同步 OW 谁是卧底
if [ -f "$WDSD_SRC" ]; then
    cp "$WDSD_SRC" "$WDSD_DST"
    echo "✅ 已同步：OW 谁是卧底 -> wdsd/index.html"
else
    echo "❌ 警告：未找到源文件 $WDSD_SRC"
fi

echo "🎉 同步完成！"
