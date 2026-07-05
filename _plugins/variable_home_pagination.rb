# frozen_string_literal: true

module Jekyll
  # Generates pagination for every localized home page. The first page has a
  # smaller capacity than subsequent pages, which jekyll-paginate cannot model.
  class VariableHomePaginator
    attr_reader :page, :per_page, :posts, :total_posts, :total_pages,
                :previous_page, :previous_page_path, :next_page, :next_page_path,
                :first_page_path, :page_path_template

    def initialize(page:, first_page_size:, per_page:, posts:, total_pages:, first_page_path:, page_path_template:)
      @page = page
      @per_page = page == 1 ? first_page_size : per_page
      @total_posts = posts.size
      @total_pages = total_pages
      @first_page_path = first_page_path
      @page_path_template = page_path_template

      offset = page == 1 ? 0 : first_page_size + ((page - 2) * per_page)
      @posts = posts.slice(offset, @per_page) || []

      @previous_page = page > 1 ? page - 1 : nil
      @next_page = page < total_pages ? page + 1 : nil
      @previous_page_path = path_for(@previous_page)
      @next_page_path = path_for(@next_page)
    end

    def to_liquid
      {
        "page" => page,
        "per_page" => per_page,
        "posts" => posts,
        "total_posts" => total_posts,
        "total_pages" => total_pages,
        "previous_page" => previous_page,
        "previous_page_path" => previous_page_path,
        "next_page" => next_page,
        "next_page_path" => next_page_path,
        "first_page_path" => first_page_path,
        "page_path_template" => page_path_template
      }
    end

    private

    def path_for(number)
      return nil unless number
      return first_page_path if number == 1

      page_path_template.sub(":num", number.to_s)
    end
  end

  class VariableHomePagination < Generator
    safe true
    priority :lowest

    def generate(site)
      first_page_size = positive_config(site, "home_first_page_posts", 5)
      per_page = positive_config(site, "paginate", 10)
      posts = visible_posts(site)
      total_pages = calculate_pages(posts.size, first_page_size, per_page)

      home_pages = site.pages.select { |page| page.data["layout"] == "home" }
      home_pages.each do |template|
        generate_for_home(site, template, posts, total_pages, first_page_size, per_page)
      end
    end

    private

    def positive_config(site, key, fallback)
      value = site.config[key].to_i
      value.positive? ? value : fallback
    end

    def visible_posts(site)
      posts = site.site_payload["site"]["posts"].reject { |post| post["hidden"] }
      pinned, normal = posts.partition { |post| post["pin"] == true }
      pinned + normal
    end

    def calculate_pages(total_posts, first_page_size, per_page)
      return 1 if total_posts <= first_page_size

      1 + ((total_posts - first_page_size).to_f / per_page).ceil
    end

    def generate_for_home(site, template, posts, total_pages, first_page_size, per_page)
      first_path = normalize_path(template.url)
      page_template = "#{first_path}page:num/".gsub(%r{/+}, "/")

      (1..total_pages).each do |page_number|
        paginator = VariableHomePaginator.new(
          page: page_number,
          first_page_size: first_page_size,
          per_page: per_page,
          posts: posts,
          total_pages: total_pages,
          first_page_path: first_path,
          page_path_template: page_template
        )

        if page_number == 1
          template.pager = paginator
          next
        end

        page_path = page_template.sub(":num", page_number.to_s)
        page = Page.new(site, site.source, template.dir, template.name)
        page.pager = paginator
        page.dir = page_path.sub(%r{^/}, "")
        page.data["permalink"] = page_path
        site.pages << page
      end
    end

    def normalize_path(path)
      normalized = path.to_s
      normalized = "/#{normalized}" unless normalized.start_with?("/")
      normalized = "#{normalized}/" unless normalized.end_with?("/")
      normalized.gsub(%r{/+}, "/")
    end
  end
end
