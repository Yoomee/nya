class CreateProjectCategories < ActiveRecord::Migration
  def change
    create_table :project_categories do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
