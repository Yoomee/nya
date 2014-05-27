class AddProjectCategoryRefToProjects < ActiveRecord::Migration
  def change
    add_reference :projects, :project_category, index: true
  end
end
