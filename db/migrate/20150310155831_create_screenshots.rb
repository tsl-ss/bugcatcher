class CreateScreenshots < ActiveRecord::Migration
  def change
    create_table :screenshots do |t|
      t.belongs_to :project, index: true
    end
    add_foreign_key :screenshots, :projects
  end
end
