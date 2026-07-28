# frozen_string_literal: true

module Jekyll
  # Generates category pages for the articles collection. Jekyll Archives only
  # groups native posts, so collection-backed articles need their own pages.
  class ArticleCategoryPages < Generator
    safe true
    priority :low

    def generate(site)
      articles = site.collections.fetch("articles", nil)&.docs || []
      add_bilingual_article_pages(site, articles)
      categories = articles.flat_map { |doc| Array(doc.data["categories"]) }.uniq

      categories.each do |category|
        add_category_page(site, category, "en", "/categories/#{slug(category)}/")
        add_category_page(site, category, "zh-CN", "/zh/categories/#{slug(category)}/")
      end
    end

    private

    def add_bilingual_article_pages(site, articles)
      articles.each do |article|
        english_title = article.data["title_en"]
        next if english_title.to_s.empty?

        chinese_url = article.url
        english_slug = article.data["slug_en"] || Utils.slugify(english_title.to_s)
        english_url = "/posts/#{english_slug}/"

        article.data["lang"] = "zh-CN"
        article.data["zh_url"] = chinese_url
        article.data["en_url"] = english_url

        next if english_url == chinese_url || site.pages.any? { |page| page.url == english_url }

        dir = english_url.sub(%r{^/}, "").sub(%r{/+$}, "")
        page = PageWithoutAFile.new(site, site.source, dir, "index.md")
        page.content = article.content
        page.data = article.data.dup
        page.data["title"] = english_title
        page.data["lang"] = "en"
        page.data["permalink"] = english_url
        page.data["zh_url"] = chinese_url
        page.data["en_url"] = english_url
        site.pages << page
      end
    end

    def add_category_page(site, category, lang, permalink)
      return if site.pages.any? { |page| page.url == permalink }

      dir = permalink.sub(%r{^/}, "").sub(%r{/+$}, "")
      page = PageWithoutAFile.new(site, site.source, dir, "index.html")
      page.data["layout"] = "category"
      page.data["title"] = category
      page.data["lang"] = lang
      page.data["permalink"] = permalink
      site.pages << page
    end

    def slug(category)
      Utils.slugify(category.to_s, mode: "pretty")
    end
  end
end
