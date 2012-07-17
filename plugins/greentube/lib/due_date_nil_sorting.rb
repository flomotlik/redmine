Query.available_columns.select{|c| c.name == :due_date}.first.sortable = "case when issues.due_date is NULL then 1 else 0 end, issues.due_date"
