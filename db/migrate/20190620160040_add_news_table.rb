class AddNewsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|
      t.string :title
      t.string :description
      t.references :user, foreign_key: true
      t.boolean :published

      t.timestamps
    end
  end
end
