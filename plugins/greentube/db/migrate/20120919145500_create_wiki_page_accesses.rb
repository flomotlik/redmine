class CreateWikiPageAccesses < ActiveRecord::Migration
  def change
    add_column :wiki_pages, :access_ids, :text
  end
end
