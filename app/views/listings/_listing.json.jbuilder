json.extract! listing, :id, :title, :price, :listing_Type, :description, :status, :created_at, :updated_at
json.url listing_url(listing, format: :json)
