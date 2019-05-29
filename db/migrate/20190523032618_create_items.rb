class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.integer :category
      t.integer :price
      t.string :manufacturer
      t.string :condition
      t.references :user, foreign_key: true
      t.boolean :published

      t.timestamps
    end
  end
end
