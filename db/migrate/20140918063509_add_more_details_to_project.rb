class AddMoreDetailsToProject < ActiveRecord::Migration
  def change
    rename_column :projects, :description, :inspiration
    rename_column :projects, :purpose, :who_helping
    add_column :projects, :how_helping, :text
    add_column :projects, :step1, :text
    add_column :projects, :step2, :text
    add_column :projects, :step3, :text
    add_column :projects, :step4, :text
    add_column :projects, :step5, :text
    add_column :projects, :skills_have, :text
    rename_column :projects, :help_needed, :skills_needed
  end
end
