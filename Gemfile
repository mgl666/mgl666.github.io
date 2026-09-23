# frozen_string_literal: true

source "https://rubygems.org"

gemspec

gem "html-proofer", "~> 5.0", group: :test
# html-proofer loads Ruby's debug library at runtime, but does not declare it.
gem "debug", group: :test
# Async 2.24 dropped Ruby 3.1 support without raising its gem requirement.
gem "async", "< 2.25", group: :test

platforms :windows, :jruby do
  gem "tzinfo", ">= 1", "< 3"
  gem "tzinfo-data"
end

gem "wdm", "~> 0.2.0", :platforms => [:windows]
