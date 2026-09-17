# frozen_string_literal: true

# 让正文里直接写的 $...$ 行内公式也能被正确渲染。
#
# 背景：kramdown 默认的 math_engine 只识别 $$...$$，单个 $...$ 会被当成普通文本，
# 其中的下划线会被解析成斜体标记，于是 x_{t-1} 这类公式会被破坏，
# 页面上显示成一段原始代码。
#
# 这里在 Markdown 解析之前把 $...$ 改写成 kramdown 认识的 $$...$$，
# kramdown 会把它输出成 \(...\) 交给 MathJax 渲染，显示效果与直接写 $...$ 一致。
module MathInlineDollar
  # 单个 $ 包裹、内容不含 $ 和换行；
  # 紧贴 $ 的位置不能是空白（照 LaTeX 常规写法），已经写成 $$...$$ 的不会被匹配
  INLINE_MATH = /(?<!\$)\$(?![\s$])([^$\n]*?)(?<![\s$])\$(?!\$)/
  CODE_FENCE_START = /\A\s*(`{3,}|~{3,})/
  MARKDOWN_EXT = %w[.md .markdown].freeze

  class << self
    # 只处理 Markdown，避免改动 .js / .scss 等页面里的 $ 语法
    def markdown_source?(item)
      MARKDOWN_EXT.include?(File.extname(item.path.to_s).downcase)
    end

    def convert(content)
      fence = nil

      content.each_line.map do |line|
        if fence
          fence = nil if line.strip.start_with?(fence)
          next line
        end

        if (matched = CODE_FENCE_START.match(line))
          fence = matched[1]
          next line
        end

        protect_inline_code(line)
      end.join
    end

    private

    # 行内代码 `...` 里的内容保持原样
    def protect_inline_code(line)
      line.split('`', -1).each_with_index.map do |segment, index|
        next segment unless index.even?

        segment.gsub(INLINE_MATH) { "$$#{Regexp.last_match(1)}$$" }
      end.join('`')
    end
  end
end

Jekyll::Hooks.register :documents, :pre_render do |doc|
  next unless MathInlineDollar.markdown_source?(doc)

  doc.content = MathInlineDollar.convert(doc.content.to_s)
end

Jekyll::Hooks.register :pages, :pre_render do |page|
  next unless MathInlineDollar.markdown_source?(page)

  page.content = MathInlineDollar.convert(page.content.to_s)
end
