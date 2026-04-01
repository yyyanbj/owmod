#!/bin/bash

# OW Workshop 小游戏合集 - 同步脚本
# 从源项目同步 visual-companion.html 到合集网站，并自动注入 Google Analytics 代码和导航栏

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SSWD_SRC="$HOME/workspace/ow-sswd/docs/visual-companion.html"
LTK_SRC="$HOME/workspace/ow-ltk/docs/visual-companion.html"

SSWD_DST="$SCRIPT_DIR/sswd/index.html"
SGS_DST="$SCRIPT_DIR/sgs/index.html"

echo "🔄 开始同步游戏文件..."

# 同步 谁是卧底
if [ -f "$SSWD_SRC" ]; then
    cp "$SSWD_SRC" "$SSWD_DST"

    # 创建临时文件注入内容
    TMP_FILE=$(mktemp)

    # 添加 CSS 链接
    sed 's|</title>|</title>\n    <link rel="stylesheet" href="../css/style.css">|' "$SSWD_DST" > "$TMP_FILE"
    mv "$TMP_FILE" "$SSWD_DST"

    # 添加 GA 代码
    TMP_FILE=$(mktemp)
    sed '/<\/head>/i\    <!-- Google tag (gtag.js) -->\n    <script async src="https://www.googletagmanager.com/gtag/js?id=G-PYGMRV8SZ9"></script>\n    <script>\n      window.dataLayer = window.dataLayer || [];\n      function gtag(){dataLayer.push(arguments);}\n      gtag('"'"'js'"'"', new Date());\n      gtag('"'"'config'"'"', '"'"'G-PYGMRV8SZ9'"'"');\n    </script>' "$SSWD_DST" > "$TMP_FILE"
    mv "$TMP_FILE" "$SSWD_DST"

    # 添加导航栏
    TMP_FILE=$(mktemp)
    sed '/<body>/a\    <!-- Top Navigation Bar -->\n    <nav class="navbar">\n        <div class="navbar-content">\n            <a href="../index.html" class="navbar-brand">🎮 OW Workshop</a>\n            <div class="navbar-links">\n                <a href="../sgs/index.html">三国杀</a>\n                <a href="../sswd/index.html">谁是卧底</a>\n                <a href="https://space.bilibili.com/23511429" target="_blank">📺 B 站</a>\n            </div>\n        </div>\n    </nav>' "$SSWD_DST" > "$TMP_FILE"
    mv "$TMP_FILE" "$SSWD_DST"

    echo "✅ 已同步：谁是卧底 -> sswd/index.html (已添加导航栏和统计代码)"
else
    echo "❌ 警告：未找到源文件 $SSWD_SRC"
fi

# 同步 三国杀
if [ -f "$LTK_SRC" ]; then
    cp "$LTK_SRC" "$SGS_DST"

    # 创建临时文件注入内容
    TMP_FILE=$(mktemp)

    # 添加 CSS 链接
    sed 's|</title>|</title>\n    <link rel="stylesheet" href="../css/style.css">|' "$SGS_DST" > "$TMP_FILE"
    mv "$TMP_FILE" "$SGS_DST"

    # 添加 GA 代码
    TMP_FILE=$(mktemp)
    sed '/<\/head>/i\    <!-- Google tag (gtag.js) -->\n    <script async src="https://www.googletagmanager.com/gtag/js?id=G-PYGMRV8SZ9"></script>\n    <script>\n      window.dataLayer = window.dataLayer || [];\n      function gtag(){dataLayer.push(arguments);}\n      gtag('"'"'js'"'"', new Date());\n      gtag('"'"'config'"'"', '"'"'G-PYGMRV8SZ9'"'"');\n    </script>' "$SGS_DST" > "$TMP_FILE"
    mv "$TMP_FILE" "$SGS_DST"

    # 添加导航栏
    TMP_FILE=$(mktemp)
    sed '/<body>/a\    <!-- Top Navigation Bar -->\n    <nav class="navbar">\n        <div class="navbar-content">\n            <a href="../index.html" class="navbar-brand">🎮 OW Workshop</a>\n            <div class="navbar-links">\n                <a href="../sgs/index.html">三国杀</a>\n                <a href="../sswd/index.html">谁是卧底</a>\n                <a href="https://space.bilibili.com/23511429" target="_blank">📺 B 站</a>\n            </div>\n        </div>\n    </nav>' "$SGS_DST" > "$TMP_FILE"
    mv "$TMP_FILE" "$SGS_DST"

    echo "✅ 已同步：三国杀 -> sgs/index.html (已添加导航栏和统计代码)"
else
    echo "❌ 警告：未找到源文件 $LTK_SRC"
fi

echo "🎉 同步完成！"
