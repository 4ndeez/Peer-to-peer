class AddNameToUsers < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :first_name, :string
    add_column :users, :second_name, :string
  end

  def down
    remove_column :users, :first_name, :string
    remove_column :users, :second_name, :string
  end
end
