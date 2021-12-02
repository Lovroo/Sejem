module ListingsHelper
  def display_listing_links(listing)
    concat content_tag(:td, link_to('Show' , listing))
    capture do
    if current_user == listing.user
      concat content_tag(:td, link_to('Edit', edit_listing_path(listing)))
      concat content_tag(:td, link_to('Destroy', listing, method: :delete, data: { confirm: 'Are you sure?' }))
    end
        end
  end
  def display_listing_show_links(listing)
    capture do
      concat ' '
        if current_user == listing.user
         concat link_to 'Edit', edit_listing_path(listing)
         concat ' '
        end
      concat link_to 'Back', listings_path
    end
  end
end

