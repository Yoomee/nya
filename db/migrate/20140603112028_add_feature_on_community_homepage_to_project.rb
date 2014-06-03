class AddFeatureOnCommunityHomepageToProject < ActiveRecord::Migration
  def change
    add_column :projects, :feature_on_community_homepage, :boolean
    add_index :projects, :feature_on_community_homepage
  end
end
