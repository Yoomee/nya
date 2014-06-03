class CreateProjectHelpOffers < ActiveRecord::Migration
  def change
    create_table :project_help_offers do |t|
      t.references :project, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
