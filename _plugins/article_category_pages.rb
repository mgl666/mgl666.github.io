# frozen_string_literal: true

module Jekyll
  # Generates category pages for the articles collection. Jekyll Archives only
  # groups native posts, so collection-backed articles need their own pages.
  class ArticleCategoryPages < Generator
    safe true
    priority :low

    def generate(site)
      articles = site.collections.fetch("articles", nil)&.docs || []
      categories = articles.flat_map { |doc| Array(doc.data["categories"]) }.uniq

      categories.each do |category|
        add_category_page(site, category, "en", "/categories/#{slug(category)}/")
        add_category_page(site, category, "zh-CN", "/zh/categories/#{slug(category)}/")
      end
    end

    private

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
