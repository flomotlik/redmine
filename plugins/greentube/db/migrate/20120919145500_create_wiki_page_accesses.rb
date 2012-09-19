class CreateWikiPageAccesses < ActiveRecord::Migration
  def change
    create_table :wiki_page_accesses do |t|
      t.column :wiki_page_id, :integer, :null => false
      t.column :user_id, :integer, :null => false
    end
    add_index :wiki_page_accesses, :wiki_page_id
    add_index :wiki_page_accesses, :user_id
  end
end
