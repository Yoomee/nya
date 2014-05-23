class AddLinkTextToContentPages < ActiveRecord::Migration
  def change
    add_column :content_pages, :link_text, :string
  end
end
