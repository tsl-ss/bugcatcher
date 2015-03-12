class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.string :title
      t.text :description
      t.boolean :open
      t.references :project, index: true

      t.timestamps null: false
    end
    add_foreign_key :releases, :projects
  end
end
