# 博客文章写作指南（本仓库）

这份文档只做一件事：告诉你如何在这个仓库里正确发布一篇新文章。  
适用目录：`_posts/`

---

## 0. 一条主线（先看这个）

每次写文按这个顺序走：

1. 新建文章文件（文件名规范）
2. 写 Front Matter（元信息）
3. 写正文（Markdown）
4. 预览与自检
5. 提交并发布

---

## 1. 新建文章文件

在 `_posts/` 下创建新文件，命名必须是：

`YYYY-MM-DD-title.md`

示例：

- `2026-05-10-ai-nowcasting-notes.md`
- `2026-05-10-my-first-post.md`

注意：

- 日期会影响文章排序与发布时间
- `title` 部分建议用英文短横线，避免空格和中文文件名问题

---

## 2. 写 Front Matter（必须）

每篇文章开头必须有 YAML 头（`---` 包裹）：

```yaml
---
title: 文章标题
date: 2026-05-10 10:00:00 +0800
categories: [AI-气象, AI短临预报]
---
```

### 2.1 必填字段

- `title`：文章标题
- `date`：发布时间（建议带 `+0800`）
- `categories`：分类（建议 1-2 个）

### 2.2 可选字段详解

下面这些字段都不是必填，但很常用：

| 字段 | 类型 | 作用 | 常见取值 |
| --- | --- | --- | --- |
| `description` | string | 自定义文章摘要（首页卡片和 SEO 会用到） | `description: 一句话摘要` |
| `pin` | boolean | 是否置顶到首页前面 | `true` / `false` |
| `author` | string | 覆盖全局作者名（单篇文章单独署名） | `author: Your Name` |
| `toc` | boolean | 是否显示右侧目录（Table of Contents） | `true` / `false` |
| `comments` | boolean | 是否开启该文章评论 | `true` / `false` |
| `math` | boolean | 启用数学公式（MathJax） | `true` |
| `mermaid` | boolean | 启用 Mermaid 图表 | `true` |
| `image` | string/object | 文章头图（封面图） | `image: /path/to/img.png` |
| `media_subpath` | string | 给当前文章媒体资源设置统一前缀路径 | `media_subpath: /posts/20260510` |

使用建议：

1. `description` 建议 1-2 句话，不要太长
2. `pin` 只给少量重点文章用，避免首页一直被置顶占满
3. `toc` 适合长文，短文可以关闭（`toc: false`）
4. `math` 和 `mermaid` 只有用到时再开，避免不必要加载
5. `image` 建议配 `alt` 文本，提升可读性与 SEO

`image` 写法示例：

```yaml
image:
  path: /assets/img/covers/cover-2026-05-10.png
  alt: 文章封面说明
```

可选字段综合示例：

```yaml
---
title: AI 短临预报记录
date: 2026-05-10 10:00:00 +0800
categories: [AI-气象, AI短临预报]
description: 记录一次短临预报实验过程与结论。
pin: false
author: Guanlong Ma
toc: true
comments: true
math: true
mermaid: false
media_subpath: /posts/20260510
image:
  path: cover.png
  alt: 雷达回波与模型输出示意图
---
```

---

## 3. 如何新建分类

### 3.1 直接在文章中使用

在 `categories` 写新分类即可：

```yaml
categories: [AI-气象, 雷达回波外推]
```

### 3.2 做中英文分类映射（推荐）

编辑 `_data/categories_i18n.yml`，新增映射，例如：

```yaml
雷达回波外推:
  en: Radar Extrapolation
  zh-CN: 雷达回波外推
```

关键点：

1. 映射键名要与文章中的分类名称一致
2. `en` 和 `zh-CN` 都建议填写

---

## 4. 写正文（Markdown）

### 4.1 推荐结构

```markdown
## 背景
## 方法
## 结果
## 总结
```

### 4.2 代码块

要标语言，方便高亮：

```python
print("hello")
```

### 4.3 图片

建议加宽高，减少页面跳动：

```markdown
![示意图](/assets/img/example.png){: w="800" h="450" }
```

---

## 5. 预览与自检

本地预览：

```bash
bundle exec jekyll serve -H 127.0.0.1 -P 4000
```

浏览器打开：

`http://127.0.0.1:4000`

发布前检查：

1. 文件是否在 `_posts/`
2. 文件名是否符合 `YYYY-MM-DD-title.md`
3. Front Matter 是否成对 `---`
4. 分类拼写是否一致
5. 页面是否正常显示（无渲染报错）

---

## 6. 提交发布

```bash
git add _posts/你的文件.md
git commit -m "feat: add new post <title>"
git push -u origin main
```

推送后在 GitHub `Actions` 查看构建状态。

---

## 7. 最小可复制模板

```markdown
---
title: 这里写标题
date: 2026-05-10 10:00:00 +0800
categories: [AI-气象, AI短临预报]
description: 一句话摘要（可选）
---

## 背景

这里写背景。

## 方法

这里写方法。

## 结果

这里写结果。
```

---

## 8. 参考示例

- `_posts/2019-08-08-write-a-new-post.md`
- `_posts/2019-08-08-text-and-typography.md`
- `_posts/2019-08-09-getting-started.md`
