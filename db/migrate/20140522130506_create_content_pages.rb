class CreateContentPages < ActiveRecord::Migration
  def change
    create_table :content_pages do |t|
      t.string :title
      t.string :subtitle
      t.text :text
      t.string :slug

      t.timestamps
    end
    add_index :content_pages, :slug, :unique => true
  end
end
