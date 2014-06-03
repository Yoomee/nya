class AddFeatureOnHomepageToProject < ActiveRecord::Migration
  def change
    add_column :projects, :feature_on_homepage, :boolean
    add_index :projects, :feature_on_homepage
  end
end
