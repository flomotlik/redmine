module IssueRelativeTimePatch
  def workdays_left
    due_date ? DateTime.now.business_days_until(due_date) : nil
  end
end

module QueryRelativeTimePatch
  def self.included(base)
    base.add_available_column(QueryColumn.new(:workdays_left, :sortable => "case when #{Issue.table_name}.due_date is NULL then 1 else 0 end, #{Issue.table_name}.due_date"))
  end
end

Issue.send(:include, IssueRelativeTimePatch)
Query.send(:include, QueryRelativeTimePatch)
