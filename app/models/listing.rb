class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :Title, presence: true
  validates :Price, presence: true
  validates :Listing_Type, presence: true
  validates :Description, presence: true
  validates :Status, presence: true
end
