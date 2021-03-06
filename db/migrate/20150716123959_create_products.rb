class CreateProducts < ActiveRecord::Migration
  def up
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :image
      t.decimal :price

      t.timestamps null: false
    end
  end
  def down
    drop_table :products
  end
end
