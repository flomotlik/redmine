class ChangeVersionStartDateToTimestamp < ActiveRecord::Migration
  def up
    change_column :versions, :sprint_start_date, :datetime
  end

  def down
    change_column :versions, :sprint_start_date, :date
  end
end
