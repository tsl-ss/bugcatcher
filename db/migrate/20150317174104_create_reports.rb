class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.references :release, index: true

      t.timestamps null: false
    end
    add_foreign_key :reports, :releases
  end
end
