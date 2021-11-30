module ListingsHelper
  def display_listing_links(listing)
    capture do
    concat "<td>#{link_to 'Show', listing }</td>".html_safe
    if current_user == listing.user
      concat "<td>#{link_to 'Edit', edit_listing_path(listing)}</td>".html_safe
      concat "<td>#{link_to 'Destroy', listing, method: :delete, data: { confirm: 'Are you sure?' }} </td>".html_safe
    end
    end
    end
  def display_listing_show_links(listing)
    capture do
    concat ""
    if current_user == listing.user
      concat link_to 'Edit', edit_listing_path(listing)
      concat '|'
    end
    concat link_to 'Back', listings_path
    end
    end
end

