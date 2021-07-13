class RemovePictureFromListings < ActiveRecord::Migration[6.0]
  def change
    remove_column :listings, :picture, :string
  end
end
