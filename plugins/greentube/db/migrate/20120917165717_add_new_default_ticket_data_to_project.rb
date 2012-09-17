class AddNewDefaultTicketDataToProject < ActiveRecord::Migration
  def change
    add_column :projects, :new_default_ticket_data, :string
  end
end
