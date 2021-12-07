class Listing < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :price, presence: true
  validates :Listing_Type, presence: true
  validates :Description, presence: true
  validates :Status, presence: true
end
