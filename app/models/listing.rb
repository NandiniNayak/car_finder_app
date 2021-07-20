class Listing < ApplicationRecord
  # belongs_to :profile
  belongs_to :buyer, class_name: "Profile", optional: true
  belongs_to :seller, class_name: "Profile"
  has_many_attached :pictures

  validates :price, presence: true

  before_validation :validate_title

  before_save :remove_whitespace
  # data sanitization, custom model methods

  def validate_title
    if self.title.length < 3
        errors.add :base, :invalid, message: "The title is invalid"
    end
  end

  def remove_whitespace
      self.title = self.title.strip
      self.description = self.description.strip
  end
end
