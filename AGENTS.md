# Repository Guidelines

## Project Structure & Module Organization

This repository is a Jekyll site based on the Chirpy theme. Published Markdown
lives in the `_articles/` collection using numbered category folders such as
`6.Algorithm/2.Hot100/76.最小覆盖子串.md`. Site settings are in `_config.yml`,
shared data in `_data/`, templates in `_layouts/` and `_includes/`, and
navigation tabs in `_tabs/`. Front-end source is in `_javascript/` and `_sass/`;
generated assets belong in `assets/`. Ruby extensions live in `_plugins/`. Never
edit generated `_site/` output.

## Build, Test, and Development Commands

Install Ruby/Bundler and Node dependencies before working:

```powershell
bundle install
npm install
npm run build                 # bundle production JavaScript and CSS
bundle exec jekyll serve      # serve locally at http://127.0.0.1:4000
npm test                      # run ESLint and Stylelint
bash tools/test.sh            # production build plus internal HTML checks
```

`tools/run.sh` is a Bash convenience wrapper for local Jekyll serving. Run the
relevant checks before submitting changes.

## Coding Style & Naming Conventions

Follow `.editorconfig`: UTF-8, LF endings, two-space indentation, no trailing
whitespace, and a final newline. Use single quotes in JavaScript, CSS, and SCSS;
use double quotes in YAML. Keep JavaScript as ES modules in `_javascript/` and
place SCSS components in the matching `_sass/` area. Let ESLint and Stylelint
enforce formatting; use `npm run lint:fix:scss` for safe SCSS fixes. Preserve
valid Markdown front matter, content/category naming patterns, and
six-digit/three-digit `sort_order` strings such as `"006002.076"`.

## Testing Guidelines

Run `npm test` after JavaScript or SCSS changes. Run `bash tools/test.sh` after
template, plugin, configuration, or content-structure changes; it rebuilds the
site and runs HTMLProofer with external links disabled. For visible layout or
content changes, check the affected page locally at desktop and narrow widths.

## Commit & Pull Request Guidelines

Use Conventional Commit subjects, consistent with repository history: `feat: add
home card`, `fix: correct category link`, or `docs: update zh cv content`. Keep
commits focused and avoid including unrelated local changes. Pull requests should
describe the user-visible effect, list tests run, link related issues where
applicable, and include before/after screenshots for visual changes.
