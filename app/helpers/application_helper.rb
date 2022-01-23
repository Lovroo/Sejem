module ApplicationHelper
  def display_navbar_session_links
    capture do
      if user_signed_in?
        concat link_to "Nov oglas", new_listing_path, class: 'nav-link'
        concat link_to "Moj Profil", edit_user_registration_path, class: 'nav-link'
        concat link_to "Sporočila", conversations_index_path, class: 'nav-link'
        concat link_to "Odjava", destroy_user_session_path, method: :delete, class: 'nav-link'
      else
    concat link_to "Prijava", new_user_session_path, class: 'nav-link'
    concat link_to "Registracija", new_user_registration_path, class: 'nav-link'
    concat link_to "Nov oglas", new_listing_path, class: 'nav-link'
    end
    end
  end
end