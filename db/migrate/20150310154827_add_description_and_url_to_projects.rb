class AddDescriptionAndUrlToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :description, :text
    add_column :projects, :url, :string
  end
end
