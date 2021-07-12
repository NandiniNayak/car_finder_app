json.extract! listing, :id, :title, :description, :price, :fuel_type, :make, :car_type, :picture, :buyer_id, :seller_id, :profile_id, :created_at, :updated_at
json.url listing_url(listing, format: :json)
