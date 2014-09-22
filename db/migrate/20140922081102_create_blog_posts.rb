class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.string :subtitle
      t.text :text
      t.string :image_uid
      t.string :image_name
      t.string :slug

      t.timestamps
    end
  end
end
