/**
 * Reference: https://bootsnipp.com/snippets/featured/link-to-top-page
 */

export function back2top() {
  const btn = document.getElementById('back-to-top');
  const progress = document.getElementById('post-progress');
  const article = document.querySelector('article');

  const updateProgress = () => {
    if (!progress || !article) {
      return;
    }

    const scrollTop = window.scrollY || document.documentElement.scrollTop;
    const articleTop = article.offsetTop;
    const articleHeight = article.offsetHeight;
    const viewportHeight = window.innerHeight;
    const total = Math.max(1, articleHeight - viewportHeight);
    const passed = scrollTop - articleTop;
    const ratio = Math.min(1, Math.max(0, passed / total));
    const percent = Math.round(ratio * 100);
    progress.textContent = `${percent}%`;
  };

  window.addEventListener('scroll', () => {
    if (window.scrollY > 50) {
      btn.classList.add('show');
    } else {
      btn.classList.remove('show');
    }

    updateProgress();
  });

  btn.addEventListener('click', () => {
    window.scrollTo({ top: 0 });
  });

  window.addEventListener('resize', updateProgress);
  updateProgress();
}
