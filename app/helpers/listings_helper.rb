module ListingsHelper
  def display_listing_links(listing)
    concat content_tag(:a, link_to('Prikaži' , listing, style: 'text-decoration: none'))
    capture do
    if current_user == listing.user
      concat content_tag(:a, link_to('Uredi', edit_listing_path(listing), style: 'text-decoration: none'))
      concat content_tag(:a, link_to('Izbriši', listing, method: :delete, data: { confirm: 'Are you sure?' }, style: 'text-decoration: none'))
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
      concat '<br/ ><br/ ><br/ >'.html_safe
      concat link_to 'Back', listings_path
    end
  end
  def display_message_seller
    if current_user.id != @listing.user.id
      concat content_tag(:h3, "Napišite sporočilo prodajalcu")
  link_to @listing.user.username, conversations_path(sender_id: current_user.id, receiver_id: @listing.user.id), method: :post
    end
  end
  def sort_link(column, title = nil, q)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    icon = sort_direction == "asc" ? "fas fa-chevron-up" : "fas fa-chevron-down"
    icon = column == sort_column ? icon : ""
    if params[:q]
      q = params[:q]
    link_to "#{title} <span class='#{icon}'></span>".html_safe, {column: column, direction: direction, q: q}, style:'text-decoration: none;font-family: FontAwesome;color:black'
    else
      link_to "#{title} <span class='#{icon}'></span>".html_safe, {column: column, direction: direction}, style:'text-decoration: none;font-family: FontAwesome;color:black'
    end
  end
  end


