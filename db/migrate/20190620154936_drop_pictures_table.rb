class DropPicturesTable < ActiveRecord::Migration[5.2]
  def up
    drop_table :pictures
  end

  def down
    raise ActiveRecord::IrreversibleOrderError
  end
end
