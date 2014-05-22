class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.float :lat
      t.float :lng
      t.string :image_uid
      t.string :image_name
      t.references :user, index: true
      t.text :help_needed
      t.text :purpose
      t.datetime :deadline

      t.timestamps
    end
  end
end
