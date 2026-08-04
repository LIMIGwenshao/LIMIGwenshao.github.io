# 个人学术主页

用于博士申请的个人主页，纯静态 HTML/CSS，无需构建工具。

## 文件结构

- `index.html` — 全部页面内容（自我介绍、News、Publications、Education、Awards）
- `assets/style.css` — 样式
- `assets/photo.jpg` — 个人照片（需自行放入）
- `assets/cv.pdf` — 简历 PDF（需自行放入）

## 日常更新

- **加一条 News**：在 `index.html` 的 `<ul class="news-list">` 里复制一个 `<li>` 块，改日期和内容，放在最上面（最新在前）。
- **加一篇论文**：复制一个 `<div class="pub">` 块，改标题、作者（自己的名字加粗）、venue、链接和 BibTeX。
- **本地预览**：直接用浏览器打开 `index.html`，或运行 `python3 -m http.server` 后访问 http://localhost:8000。

## 部署到 GitHub Pages

1. 在 GitHub 上创建一个名为 `<你的用户名>.github.io` 的**公开**仓库（名字必须完全一致）。
2. 在本目录执行：
   ```sh
   git init
   git add .
   git commit -m "Initial academic homepage"
   git branch -M main
   git remote add origin git@github.com:<你的用户名>/<你的用户名>.github.io.git
   git push -u origin main
   ```
3. 几分钟后访问 `https://<你的用户名>.github.io` 即可。之后每次 `git push` 自动更新。
