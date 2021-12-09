module ApplicationHelper
  def display_navbar_session_links
    capture do
      if user_signed_in?
        concat link_to "Uredi Profil", edit_user_registration_path
        concat " "
        concat link_to "Odjava", destroy_user_session_path, method: :delete
        concat " "
        concat link_to "Nov oglas", new_listing_path
      else
    concat link_to "Prijava", new_user_session_path
    concat " "
    concat link_to "Registracija", new_user_registration_path
    concat " "
    concat link_to "Nov oglas", new_listing_path
    end
    end
  end
end