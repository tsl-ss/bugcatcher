class AddUserToReports < ActiveRecord::Migration
  def change
    add_column :reports, :author_id, :integer
  end
end
