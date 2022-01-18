class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :title, presence: true
  validates :price, presence: true
  validates :listing_type, presence: true
  validates :description, presence: true
  validates :status, presence: true
  has_one_attached :image
  validates :image, attached: true
end
