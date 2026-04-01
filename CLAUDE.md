# OW Workshop 小游戏合集

Overwatch Workshop 创意游戏合集网站，部署在 GitHub Pages。

## 项目结构

```
owmod/
├── index.html          # 首页 - 游戏列表导航
├── css/style.css       # 全局样式
├── sswd/index.html     # OW 三国杀游戏（从 ow-sswd 同步）
├── ltk/index.html      # OW LTK 游戏（从 ow-ltk 同步）
└── sync.sh             # 同步脚本
```

## 开发流程

### 同步游戏文件

从源项目同步 `visual-companion.html` 文件：

```bash
./sync.sh
```

### 本地测试

使用 Python 内置服务器预览：

```bash
python -m http.server 8000
# 访问 http://localhost:8000
```

### 部署到 GitHub Pages

```bash
git add .
git commit -m "更新游戏内容"
git push origin main
```

网站将自动部署到 `https://<username>.github.io/owmod/`

## 源项目

- **OW 三国杀**: `~/workspace/ow-sswd/src/visual-companion.html`
- **OW LTK**: `~/workspace/ow-ltk/visual-companion.html`

## 添加新游戏

1. 在游戏源项目创建 `visual-companion.html`
2. 在 `owmod/` 下创建新目录（如 `new-game/`）
3. 更新 `sync.sh` 添加同步规则
4. 更新 `index.html` 添加游戏卡片
