class AddContextToPost < ActiveRecord::Migration
  def change
    add_column :posts, :context, :string
  end
end
