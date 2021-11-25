json.extract! listing, :id, :Title, :Price, :Listing_Type, :Description, :Status, :created_at, :updated_at
json.url listing_url(listing, format: :json)
