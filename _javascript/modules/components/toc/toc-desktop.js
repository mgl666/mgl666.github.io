export class TocDesktop {
  static get headingSelector() {
    if (!document.querySelector('.content-zh, .content-en')) {
      return 'h2, h3';
    }

    const contentClass = document.documentElement.lang === 'zh-CN' ? '.content-zh' : '.content-en';
    return `${contentClass} h2, ${contentClass} h3`;
  }

  /* Tocbot options Ref: https://github.com/tscanlin/tocbot#usage */
  static get options() {
    return {
      tocSelector: '#toc',
      contentSelector: '.content',
      ignoreSelector: '[data-toc-skip]',
      headingSelector: this.headingSelector,
      orderedList: false,
      scrollSmooth: false,
      collapseDepth: 3,
      headingsOffset: 16 * 2 // 2rem
    };
  }

  static refresh() {
    tocbot.refresh(this.options);
  }

  static init() {
    tocbot.init(this.options);
  }
}
