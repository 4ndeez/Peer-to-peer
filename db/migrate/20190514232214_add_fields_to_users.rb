class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :role, :integer, default: 0
    add_column :users, :birth_date, :date
    add_column :users, :gender, :boolean
    add_column :users, :nickname, :string
    add_column :users, :city, :string
    add_column :users, :first_phone, :string
    add_column :users, :second_phone, :string
    add_attachment :users, :avatar
  end

  def down
    remove_column :users, :role, :integer
    remove_column :users, :birth_date, :date
    remove_column :users, :gender, :boolean
    remove_column :users, :nickname, :string
    remove_column :users, :city, :string
    remove_column :users, :first_phone, :string
    remove_column :users, :second_phone, :string
    remove_attachment :users, :avatar
  end
end
