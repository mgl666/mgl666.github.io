/**
 * Language content switcher for bilingual articles.
 * Shows/hides Chinese/English content blocks based on user preference.
 */

const LANG_STORAGE_KEY = 'preferred_lang';
const LANG_ZH = 'zh-CN';
const LANG_EN = 'en';

class LangContentSwitcher {
  static #currentLang = null;

  static get preferredLang() {
    if (this.#currentLang) {
      return this.#currentLang;
    }
    const stored = localStorage.getItem(LANG_STORAGE_KEY);
    if (stored === LANG_ZH || stored === LANG_EN) {
      this.#currentLang = stored;
      return stored;
    }
    const htmlLang = document.documentElement.getAttribute('lang');
    if (htmlLang && htmlLang.startsWith('zh')) {
      this.#currentLang = LANG_ZH;
      return LANG_ZH;
    }
    this.#currentLang = LANG_ZH;
    return LANG_ZH;
  }

  static setLang(lang) {
    if (lang !== LANG_ZH && lang !== LANG_EN) {
      return;
    }
    this.#currentLang = lang;
    localStorage.setItem(LANG_STORAGE_KEY, lang);
    this.#applyLang();
  }

  static #applyLang() {
    const isZh = this.#currentLang === LANG_ZH;

    document.documentElement.setAttribute('lang', isZh ? LANG_ZH : LANG_EN);

    const zhBlocks = document.querySelectorAll('.content-zh');
    const enBlocks = document.querySelectorAll('.content-en');

    zhBlocks.forEach((el) => {
      el.style.display = isZh ? '' : 'none';
    });
    enBlocks.forEach((el) => {
      el.style.display = isZh ? 'none' : 'block';
    });

    const postTitle = document.getElementById('post-title');
    if (postTitle) {
      const zhTitle = postTitle.getAttribute('data-zh-title');
      const enTitle = postTitle.getAttribute('data-en-title');
      if (isZh && zhTitle) {
        postTitle.textContent = zhTitle;
      } else if (!isZh && enTitle) {
        postTitle.textContent = enTitle;
      }
    }

    this.#updateSidebarLinks();
    this.#updateBreadcrumb();
    this.#updateCategoryLinks();
    this.#updatePostMetaLabels();
  }

  static #updateSidebarLinks() {
    const enLink = document.getElementById('lang-switch-en');
    const zhLink = document.getElementById('lang-switch-zh');
    const isZh = this.#currentLang === LANG_ZH;

    if (enLink) {
      enLink.classList.toggle('active', !isZh);
    }
    if (zhLink) {
      zhLink.classList.toggle('active', isZh);
    }

    const siteTitle = document.getElementById('site-title-link');
    if (siteTitle) {
      const text = isZh
        ? siteTitle.getAttribute('data-zh-text')
        : siteTitle.getAttribute('data-en-text');
      if (text) {
        siteTitle.textContent = text;
      }
      const url = isZh
        ? siteTitle.getAttribute('data-zh-url')
        : siteTitle.getAttribute('data-en-url');
      if (url) {
        siteTitle.setAttribute('href', url);
      }
    }

    const siteSubtitle = document.getElementById('site-subtitle-text');
    if (siteSubtitle) {
      const text = isZh
        ? siteSubtitle.getAttribute('data-zh-text')
        : siteTitle.getAttribute('data-en-text');
      if (text) {
        siteSubtitle.textContent = text;
      }
    }

    const breadcrumbHome = document.getElementById('breadcrumb-home-text');
    if (breadcrumbHome) {
      const text = isZh
        ? breadcrumbHome.getAttribute('data-zh-label')
        : breadcrumbHome.getAttribute('data-en-label');
      if (text) {
        breadcrumbHome.textContent = text;
      }
    }
  }

  static #updateBreadcrumb() {
    const isZh = this.#currentLang === LANG_ZH;

    document.querySelectorAll('.i18n-breadcrumb-categories').forEach((el) => {
      const text = isZh
        ? el.getAttribute('data-zh-label')
        : el.getAttribute('data-en-label');
      if (text) {
        el.textContent = text;
      }
    });

    document.querySelectorAll('.i18n-breadcrumb-current-category').forEach((el) => {
      const text = isZh
        ? el.getAttribute('data-zh-label')
        : el.getAttribute('data-en-label');
      if (text) {
        el.textContent = text;
      }
    });
  }

  static #updateCategoryLinks() {
    const isZh = this.#currentLang === LANG_ZH;

    document.querySelectorAll('.i18n-post-category-link').forEach((el) => {
      const name = isZh
        ? el.getAttribute('data-zh-name')
        : el.getAttribute('data-en-name');
      if (name) {
        el.textContent = name;
      }
    });
  }

  static #updatePostMetaLabels() {
    const isZh = this.#currentLang === LANG_ZH;

    const postedLabel = document.querySelector('.i18n-posted-label');
    if (postedLabel) {
      const text = isZh
        ? postedLabel.getAttribute('data-zh-label')
        : postedLabel.getAttribute('data-en-label');
      if (text) {
        postedLabel.textContent = text;
      }
    }

    const updatedLabel = document.querySelector('.i18n-updated-label');
    if (updatedLabel) {
      const text = isZh
        ? updatedLabel.getAttribute('data-zh-label')
        : updatedLabel.getAttribute('data-en-label');
      if (text) {
        updatedLabel.textContent = text;
      }
    }

    const writtenByLabel = document.querySelector('.i18n-written-by-label');
    if (writtenByLabel) {
      const text = isZh
        ? writtenByLabel.getAttribute('data-zh-label')
        : writtenByLabel.getAttribute('data-en-label');
      if (text) {
        writtenByLabel.textContent = text;
      }
    }

    const pageviewLabel = document.querySelector('.i18n-pageview-measure');
    if (pageviewLabel) {
      const text = isZh
        ? pageviewLabel.getAttribute('data-zh-label')
        : pageviewLabel.getAttribute('data-en-label');
      if (text) {
        pageviewLabel.textContent = text;
      }
    }
  }

  static init() {
    this.#applyLang();

    const enLink = document.getElementById('lang-switch-en');
    const zhLink = document.getElementById('lang-switch-zh');

    const handleSwitch = (lang) => {
      this.setLang(lang);
    };

    if (enLink) {
      enLink.addEventListener('click', (e) => {
        const switchable = enLink.closest('.lang-switch')?.getAttribute('data-switchable');
        if (switchable === 'true') {
          return;
        }
        e.preventDefault();
        handleSwitch(LANG_EN);
      });
    }

    if (zhLink) {
      zhLink.addEventListener('click', (e) => {
        const switchable = zhLink.closest('.lang-switch')?.getAttribute('data-switchable');
        if (switchable === 'true') {
          return;
        }
        e.preventDefault();
        handleSwitch(LANG_ZH);
      });
    }
  }
}

export { LangContentSwitcher };
