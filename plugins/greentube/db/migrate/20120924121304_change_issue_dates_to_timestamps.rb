class ChangeIssueDatesToTimestamps < ActiveRecord::Migration
  def up
    change_column :issues, :due_date, :datetime
    change_column :issues, :start_date, :datetime
  end

  def down
    change_column :issues, :due_date, :date
    change_column :issues, :start_date, :date
  end
end
