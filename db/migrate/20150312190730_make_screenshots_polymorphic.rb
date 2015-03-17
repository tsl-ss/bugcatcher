class MakeScreenshotsPolymorphic < ActiveRecord::Migration
  def change
    remove_column :screenshots, :project_id
    add_column :screenshots, :screenshotable_id, :integer
    add_column :screenshots, :screenshotable_type, :string
  end
end
