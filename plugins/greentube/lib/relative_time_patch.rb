module IssueRelativeTimePatch
  def workdays_left
    due_date ? DateTime.now.business_days_until(due_date) : nil
  end
end

module QueryRelativeTimePatch
  def self.included(base)
    base.add_available_column(QueryColumn.new(:workdays_left, :sortable => "#{Issue.table_name}.due_date"))
  end
end

Issue.send(:include, IssueRelativeTimePatch)
Query.send(:include, QueryRelativeTimePatch)
