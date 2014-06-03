class AddProjectCategoryIdToForum < ActiveRecord::Migration
  def change
    add_column :forums, :project_category_id, :integer
    add_index :forums, :project_category_id
  end
end
