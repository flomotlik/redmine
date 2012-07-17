require 'redmine'
require 'issue_colors_patch'

Redmine::Plugin.register :greentube do
  name 'Greentube plugin'
  author 'Florian Motlik'
  description 'This plugin provides All customisations used inhouse by Greentube'
  version '0.0.1'
  url 'https://github.com/greentube/redmine'
  author_url 'https://github.com/greentube/redmine'
end

Holidays.between(Date.civil(2012, 1, 1), 3.years.from_now, :at).map{|holiday| BusinessTime::Config.holidays << holiday[:date]}
