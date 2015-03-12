class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.text :bio
      t.string :email
      t.string :github
      t.string :linkedin
      t.string :twitter
      t.string :facebook

      t.timestamps null: false
    end
  end
end
