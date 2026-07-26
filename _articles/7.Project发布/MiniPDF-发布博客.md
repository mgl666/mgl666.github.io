---
title: "MiniPDF：一款轻量级本地 PDF 阅读器与管理工具"
title_zh: "MiniPDF：一款轻量级本地 PDF 阅读器与管理工具"
title_en: "MiniPDF: A Lightweight Local PDF Reader and Management Tool"
date: 2026-07-14 23:40:32 +0800
categories: [项目发布]
sort_order: "007000.002"
---

<div class="content-zh" markdown="1">

## 缘起

我电脑里存了不少 PDF——技术文档、论文、电子书、合同协议，散落在各个文件夹里。每次想看点什么，都得在 Finder 里翻半天，找到了还要用系统预览或浏览器打开，没有标注、没有分类、没有统一管理。

市面上的 PDF 工具，要么太笨重——Adobe Acrobat 安装包几百 MB、启动慢、功能多到用不上；要么太简陋——系统预览只能看不能批注，浏览器打开后无法管理。

我想要的很明确：

1. 选一个文件夹，自动按目录结构分类所有 PDF
2. 打开就能看，看完能标注（高亮、笔记、便利贴）
3. 偶尔需要合并、压缩、调整页面顺序
4. 界面干净、打开快、不占地

于是，**MiniPDF** 诞生了。

---

## MiniPDF 是什么

MiniPDF 是一个**十分轻量级的本地 PDF 阅读器和管理工具**，安装包仅 ~7 MB，启动秒开。基于 Tauri 2 + React 18 + TypeScript + Rust 构建，核心就三个字：**快、小、够用**。

核心思路是「**文件夹即分类**」——不需要手动导入、不需要建数据库，选择一个 PDF 根目录，MiniPDF 自动扫描并按文件夹结构组织好一切。

---

## 核心功能

### 📂 文件夹即分类

这是 MiniPDF 最核心的设计理念。你只需要在设置里选择一个 PDF 根目录，MiniPDF 会：

- 扫描根目录下的 PDF → 归入「未分类」
- 扫描一级子文件夹 → 生成对应分类
- 扫描二级子文件夹 → 生成子分类
- 聚合所有 PDF → 「全部PDF」视图

整个过程不需要任何导入操作，你在 Finder/资源管理器里怎么整理文件夹，MiniPDF 就怎么显示。

### 📖 多标签页阅读

内嵌了 Mozilla 的 pdf.js 完整阅读器，支持：

- **连续滚动 / 单页模式**，自由切换
- **缩放控制**：放大、缩小、适应宽度、适应页面
- **页码跳转**：输入页码直接跳转
- **缩略图侧边栏**：快速定位页面位置
- **书签大纲导航**：读取 PDF 内部目录结构
- **多标签页**：同时打开多个 PDF，标签页间自由切换，互不干扰

### 🖊️ 标注工具

标注功能直接借助 pdf.js 内置的标注系统，不用单独开发一层 Canvas：

- **文本高亮**：选中文字自动高亮，多色可选
- **荧光笔 / 写字笔**：自由绘制，圈画重点
- **便利贴**：点击任意位置添加文本备注
- **橡皮擦**：擦除不需要的标注
- **Ctrl+S 保存**：标注直接写入 PDF 文件
- **脏状态检测**：关闭标签页时如果未保存会弹出提示

### 🛠️ 高级工具

有时候需要处理 PDF 文件本身，MiniPDF 内置了三个实用工具：

- **页面调整**：选择 PDF → 拖动缩略图调整页面顺序 → 删除不需要的页面 → 导出
- **PDF 合并**：拖入多个 PDF → 调整合并顺序 → 一键导出
- **PDF 压缩**：选择 PDF → 滑块调节压缩质量 → 压缩后显示文件大小对比

所有工具都支持拖拽操作，把文件拖到面板上就能开始处理。

### 🎨 主题与设置

- **三种主题**：浅色、深色、跟随系统自动切换
- **阅读器同步**：暗色模式下 pdf.js 阅读器内部也会自动变暗
- **配置持久化**：PDF 根目录、主题、默认缩放等设置自动保存，下次打开即用

---

## 下载与安装

### macOS (Apple Silicon)

下载 `MiniPDF_0.1.0_aarch64.dmg`，双击打开后将 MiniPDF 拖入 Applications 文件夹即可。

> 首次打开时，由于未经过 Apple 公证，可能需要在「系统设置 → 隐私与安全性」中点击「仍要打开」。

### Windows (x64)

下载 `MiniPDF_0.1.0_x64-setup.exe` 或 `MiniPDF_0.1.0_x64_en-US.msi`，双击安装即可。

> 需要系统已安装 WebView2 Runtime（Windows 11 自带，Windows 10 通常会自动安装）。

---

## 后续计划

v0.1.0 是第一版，还有很多想做的功能：

- [ ] PDF 分割工具
- [ ] 搜索 PDF（按文件名）
- [ ] 阅读进度记忆
- [ ] 最近打开列表
- [ ] 全文搜索（PDF 内容搜索）
- [ ] PDF 密码支持
- [ ] 更多标注导出格式
- [ ] Apple Developer ID 签名和公证
- [ ] 自动更新

如果你有好的建议，欢迎到 [GitHub Issues](https://github.com/mgl666/MiniPDF/issues) 提出。

---

## 许可

MiniPDF 采用**非商业使用许可协议**，仅限个人、非商业目的免费使用。详见 [LICENSE](https://github.com/mgl666/MiniPDF/blob/main/LICENSE)。

本软件使用了 Mozilla 的 [pdf.js](https://github.com/mozilla/pdf.js)（Apache License 2.0）。

---

## 最后

从想法到打包，MiniPDF 现在终于可以拿出来见人了。

它不够完美，但够用——~7MB 的体积，秒开的启动速度，文件夹即分类的直觉设计。

如果你也有一堆 PDF 需要管理，试试看。

</div>

<div class="content-en" markdown="1">

## The Origin

I have quite a few PDFs stored on my computer — technical documents, papers, e-books, contracts and agreements, scattered across various folders. Every time I want to read something, I have to dig through Finder for ages, and when I find it, I still have to open it with system preview or a browser — no annotations, no categorization, no unified management.

The PDF tools on the market are either too heavy — Adobe Acrobat with hundreds of MB installers, slow startup, and features I'll never use; or too bare-bones — system preview can only view without annotating, and browser-opened PDFs can't be managed.

What I wanted was clear:

1. Select a folder, automatically categorize all PDFs by directory structure
2. Open and read immediately, annotate after reading (highlights, notes, sticky notes)
3. Occasionally need to merge, compress, or rearrange page order
4. Clean interface, fast startup, small footprint

And thus, **MiniPDF** was born.

---

## What is MiniPDF

MiniPDF is an **extremely lightweight local PDF reader and management tool**, with an install package of only ~7 MB and instant startup. Built with Tauri 2 + React 18 + TypeScript + Rust, its core values are three words: **fast, small, good enough**.

The core concept is "**folders as categories**" — no manual import, no database creation needed. Select a PDF root directory, and MiniPDF automatically scans and organizes everything by folder structure.

---

## Core Features

### 📂 Folders as Categories

This is the most fundamental design philosophy of MiniPDF. You just need to select a PDF root directory in settings, and MiniPDF will:

- Scan PDFs in the root directory → assign to "Uncategorized"
- Scan first-level subfolders → generate corresponding categories
- Scan second-level subfolders → generate subcategories
- Aggregate all PDFs → "All PDFs" view

The entire process requires no import operations whatsoever. However you organize folders in Finder/File Explorer, MiniPDF displays it the same way.

### 📖 Multi-tab Reading

Embedded with Mozilla's complete pdf.js reader, supporting:

- **Continuous scrolling / single page mode**, freely switchable
- **Zoom controls**: Zoom in, zoom out, fit width, fit page
- **Page jump**: Enter page number to jump directly
- **Thumbnail sidebar**: Quickly locate page positions
- **Bookmark outline navigation**: Read PDF internal table of contents
- **Multi-tab**: Open multiple PDFs simultaneously, freely switch between tabs without interference

### 🖊️ Annotation Tools

Annotation features directly leverage pdf.js's built-in annotation system, no need for a separate Canvas layer:

- **Text highlighting**: Select text to auto-highlight, multiple colors available
- **Highlighter / Pen**: Free drawing, circle key points
- **Sticky notes**: Click anywhere to add text notes
- **Eraser**: Erase unwanted annotations
- **Ctrl+S save**: Annotations written directly into the PDF file
- **Dirty state detection**: Prompts when closing a tab if changes haven't been saved

### 🛠️ Advanced Tools

Sometimes you need to process the PDF files themselves. MiniPDF has three built-in practical tools:

- **Page rearrangement**: Select PDF → drag thumbnails to reorder pages → delete unwanted pages → export
- **PDF merge**: Drag in multiple PDFs → adjust merge order → one-click export
- **PDF compression**: Select PDF → adjust compression quality with slider → compare file sizes before and after compression

All tools support drag-and-drop operations. Just drag files onto the panel to start processing.

### 🎨 Themes & Settings

- **Three themes**: Light, dark, follow system auto-switch
- **Reader sync**: In dark mode, the pdf.js reader interior also automatically dims
- **Persistent configuration**: PDF root directory, theme, default zoom, and other settings are automatically saved and ready for next launch

---

## Download & Installation

### macOS (Apple Silicon)

Download `MiniPDF_0.1.0_aarch64.dmg`, double-click to open, then drag MiniPDF into the Applications folder.

> On first launch, since it hasn't been notarized by Apple, you may need to go to "System Settings → Privacy & Security" and click "Open Anyway".

### Windows (x64)

Download `MiniPDF_0.1.0_x64-setup.exe` or `MiniPDF_0.1.0_x64_en-US.msi`, double-click to install.

> Requires WebView2 Runtime to be installed on the system (Windows 11 comes with it, Windows 10 usually installs it automatically).

---

## Future Plans

v0.1.0 is the first version, and there are many features still to come:

- [ ] PDF split tool
- [ ] Search PDFs (by filename)
- [ ] Reading progress memory
- [ ] Recently opened list
- [ ] Full-text search (PDF content search)
- [ ] PDF password support
- [ ] More annotation export formats
- [ ] Apple Developer ID signing and notarization
- [ ] Auto-update

If you have suggestions, feel free to submit them at [GitHub Issues](https://github.com/mgl666/MiniPDF/issues).

---

## License

MiniPDF is licensed under a **Non-Commercial Use License**, free for personal, non-commercial use only. See [LICENSE](https://github.com/mgl666/MiniPDF/blob/main/LICENSE) for details.

This software uses Mozilla's [pdf.js](https://github.com/mozilla/pdf.js) (Apache License 2.0).

---

## Final Words

From idea to packaged app, MiniPDF is finally ready to be seen.

It's not perfect, but it's good enough — ~7MB footprint, instant startup speed, intuitive folder-as-category design.

If you also have a pile of PDFs to manage, give it a try.

</div>