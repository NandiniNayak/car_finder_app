class Listing < ApplicationRecord
  # belongs_to :profile
  belongs_to :buyer, class_name: "Profile", optional: true
  belongs_to :seller, class_name: "Profile"

  has_many_attached :pictures
end
