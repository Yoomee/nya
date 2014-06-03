class CreateProjectOwners < ActiveRecord::Migration
  def change
    create_table :project_owners do |t|
      t.references :project, index: true
      t.references :owner, index: true

      t.timestamps
    end
  end
end
