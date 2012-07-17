require 'redmine'
require 'issue_colors_patch'

Redmine::Plugin.register :issue_colors do
  name 'Issue Colors plugin'
  author 'Florian Motlik'
  description 'This plugin provides Issue Coloring according to inhouse rules'
  version '0.0.1'
  url 'https://github.com/greentube/redmine'
  author_url 'https://github.com/greentube/redmine'
end

Holidays.between(Date.civil(2012, 1, 1), 3.years.from_now, :at).map{|holiday| BusinessTime::Config.holidays << holiday[:date]}
