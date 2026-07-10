#!/usr/bin/env ruby
#
# Check for changed articles

Jekyll::Hooks.register :documents, :post_init do |post|
  next unless post.collection.label == 'articles'

  commit_num = `git rev-list --count HEAD "#{ post.path }"`

  if commit_num.to_i > 1
    lastmod_date = `git log -1 --pretty="%ad" --date=iso "#{ post.path }"`
    post.data['last_modified_at'] = lastmod_date
  end

end
