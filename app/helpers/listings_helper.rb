module ListingsHelper
  def display_listing_links(listing)
    concat content_tag(:a, link_to('Prikaži' , listing))
    capture do
    if current_user == listing.user
      concat content_tag(:a, link_to('Uredi', edit_listing_path(listing)))
      concat content_tag(:a, link_to('Izbriši', listing, method: :delete, data: { confirm: 'Are you sure?' }))
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
  end


