class ChangeDatetimesBackToDates < ActiveRecord::Migration
  def up
    change_column :issues, :due_date, :date
    change_column :issues, :start_date, :date
    change_column :versions, :effective_date, :date
    change_column :versions, :sprint_start_date, :date
  end

  def down
    change_column :issues, :start_date, :datetime
    change_column :issues, :due_date, :datetime
    change_column :versions, :effective_date, :datetime
    change_column :versions, :sprint_start_date, :datetime
  end
end
