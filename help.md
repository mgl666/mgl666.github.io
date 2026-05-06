# Chirpy 个人主页修改指南

这份文档用于你当前这个 `jekyll-theme-chirpy-master` 项目。

## 1) 修改头像、姓名、邮箱等个人信息

主要改这个文件：`_config.yml`

---

## 2) 在哪里加入你写的 Markdown 博客

把文章放到目录：`_posts/`

文件名格式建议：

`YYYY-MM-DD-your-title.md`

例如：

`2026-05-06-my-first-post.md`

每篇文章顶部要有 Front Matter，例如：

```yaml
---
title: 我的第一篇文章
date: 2026-05-06 10:00:00 +0800
categories: [AI-气象, AI短临预报]
tags: [nowcasting, deep-learning]
---
```

然后正文直接写 Markdown 即可。

---

## 3) 怎么设置 Categories

在每篇文章的 Front Matter 里设置 `categories`：

```yaml
categories: [一级分类, 二级分类]
```

例如：

```yaml
categories: [AI-气象, AI短临预报]
```

你现在站点的分类结构可按下面方式组织：

- `AI-气象`
  - `AI短临预报`
  - `AI气象大模型`
  - `AI气候预报`
- `AI-CV`
- `AI-LLM`

说明：

- 写成 `[AI-气象, AI短临预报]` 会出现在 `AI-气象` 的二级里。
- 写成 `[AI-CV]` 或 `[AI-LLM]` 就是单一级分类。
- Categories 页面支持一级展开/收缩，你已开启。

---

## 常用修改位置速查

- 全局个人信息：`_config.yml`
- 文章内容：`_posts/*.md`
- 中文首页入口：`zh/index.html`
- 侧边栏导航页面：`_tabs/`
- 语言文案映射：`_data/locales/en.yml`、`_data/locales/zh-CN.yml`

