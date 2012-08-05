require 'redmine'
require 'issue_colors_patch'
require 'relative_time_patch'
require 'due_date_nil_sorting'

Redmine::Plugin.register :greentube do
  name 'Greentube plugin'
  author 'Florian Motlik'
  description 'This plugin provides All customisations used inhouse by Greentube'
  version '0.0.1'
  url 'https://github.com/greentube/redmine'
  author_url 'https://github.com/greentube/redmine'
  requires_redmine :version_or_higher => '2.0.0'
  menu :top_menu, :polls, { :controller => 'issues', :assigned_to_id => 'me', :set_filter => 1, :sort => 'priority:desc,updated_on:desc'}, :caption => :label_my_issues
end

BusinessTime::Config.beginning_of_workday = "10:00 am"
BusinessTime::Config.end_of_workday = "6:00 pm"
Holidays.between(Date.civil(2012, 1, 1), 3.years.from_now, :at).map{|holiday| BusinessTime::Config.holidays << holiday[:date]}
