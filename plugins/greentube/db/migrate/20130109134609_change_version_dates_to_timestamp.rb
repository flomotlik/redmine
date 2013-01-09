class ChangeVersionDatesToTimestamp < ActiveRecord::Migration
  def up
    change_column :versions, :effective_date, :datetime
  end

  def down
    change_column :versions, :effective_date, :date
  end
end
