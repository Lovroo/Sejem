module ApplicationHelper
  def display_navbar_session_links
    capture do
      if user_signed_in?
        concat link_to "Nov oglas", new_listing_path, class: 'btn btn-outline-secondary', style: 'margin-right: 10px;'
        concat " "
        concat link_to "Moj Profil", edit_user_registration_path, class: 'btn btn-outline-secondary', style: 'margin-right: 10px;'
        concat " "
        concat link_to "Odjava", destroy_user_session_path, method: :delete, class: 'btn btn-outline-secondary', style: 'margin-right: 10px;'
      else
    concat link_to "Prijava", new_user_session_path, class: 'btn btn-outline-secondary', style: 'margin-right: 10px;'
    concat " "
    concat link_to "Registracija", new_user_registration_path, class: 'btn btn-outline-secondary', style: 'margin-right: 10px;'
    concat " "
    concat link_to "Nov oglas", new_listing_path, class: 'btn btn-outline-secondary', style: 'margin-right: 10px;'
    end
    end
  end
end