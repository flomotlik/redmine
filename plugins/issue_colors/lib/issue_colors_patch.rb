require_dependency 'issues_helper'

module IssueColorsPatch
  def self.included(base)
    base.send(:include, InstanceMethods)
    base.class_eval do
      alias_method_chain :css_classes, :deadline_colors
    end
  end

  module InstanceMethods
    def css_classes_with_deadline_colors
      #Adding a 8 hours for a full working day, as the due date is counted for as well
      # Dividing by 3600 as business_time_until gives back the time in seconds
      css_classes_without_deadline_colors.tap do |classes|
        if due_date && estimated_hours
          working_hours_left = Time.now.business_time_until(due_date.to_time+1.day)/3600
          critical = estimated_hours*1.5
          alert = estimated_hours*2
          problematic = estimated_hours*3
          ok = estimated_hours*4

          status = case working_hours_left
                   when 0..estimated_hours then "overdue"
                   when estimated_hours..critical then "critical"
                   when critical..alert then "alert"
                   when alert..problematic then "problematic"
                   when problematic..ok then "ok"
                   else "fine"
                   end
          classes << ' ' + status
        end
      end
    end
  end
end

Issue.send(:include, IssueColorsPatch)
