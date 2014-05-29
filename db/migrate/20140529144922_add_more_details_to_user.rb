class AddMoreDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :city, :string
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
    add_column :users, :facebook, :string
    add_column :users, :twitter, :string
    add_column :users, :slug, :string
  end
end
