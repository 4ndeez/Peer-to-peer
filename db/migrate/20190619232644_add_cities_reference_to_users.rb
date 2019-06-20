class AddCitiesReferenceToUsers < ActiveRecord::Migration[5.2]
  def up
    add_reference :users, :city, foreign_key: true
    remove_column :users, :city
    User.update_all(city_id: 8)
  end

  def down
    remove_reference :users, :city
    add_column :users, :city, :string
  end
end
