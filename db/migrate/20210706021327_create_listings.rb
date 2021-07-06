class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.float :price
      t.string :fuel_type
      t.date :make
      t.string :car_type
      t.string :picture
      t.integer :buyer_id
      t.integer :seller_id
      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
