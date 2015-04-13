class AddDefaultForOpenToReleases < ActiveRecord::Migration
  def change
    change_column_default(:releases, :open, true)
  end
end
