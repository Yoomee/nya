class AddSlugToProjectCategories < ActiveRecord::Migration
  def change
    add_column :project_categories, :slug, :string
    add_index :project_categories, :slug, :unique => true
  end
end
