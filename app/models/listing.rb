class Listing < ApplicationRecord
  belongs_to :user
  validates :Title, presence: true
  validates :Price, presence: true
  validates :Listing_Type, presence: true
  validates :Description, presence: true
  validates :Status, presence: true
end
