class AddCitiesReferenceToItems < ActiveRecord::Migration[5.2]
  def up
    add_reference :items, :city, foreign_key: true
    remove_column :items, :city
    Item.update_all(city_id: 8)
  end

  def down
    remove_reference :items, :city
    add_column :items, :city, :string
  end
end
