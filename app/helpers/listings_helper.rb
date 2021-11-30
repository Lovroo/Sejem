module ListingsHelper
  def display_listing_links(listing)
    html = "<td>#{link_to 'Show', listing }</td>"
    if current_user == listing.user
      html +=  "<td>#{link_to 'Edit', edit_listing_path(listing)}</td>"
      html += "<td>#{link_to 'Destroy', listing, method: :delete, data: { confirm: 'Are you sure?' }} </td>"
    end
    html.html_safe
  end
  def display_listing_show_links(listing)
    html = ""
    if current_user == listing.user
    html +=  link_to 'Edit', edit_listing_path(listing)
    html += '|'
    end
    html += link_to 'Back', listings_path
  html.html_safe
  end
end

