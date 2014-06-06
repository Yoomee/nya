class CreateForumUsers < ActiveRecord::Migration
  def change
    create_table :forum_users do |t|
      t.references :forum, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
