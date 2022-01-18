# frozen_string_literal: true
class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :verify_authenticity_token, :only => :create
  def new
    @user = User.new
    @country_options = country_options(['CN', 'HK'])
  end

  def edit
    @user = User.find(params[:id])
  end

  # for rendering city options after user selects the 'country' field in edit profile form
  def subregion_options
    render partial: 'subregion_select'
  end

  private
  # sets locale for country-city selection display
  def set_carmen_locale
    locale = I18n.locale
    Carmen.i18n_backend.locale = locale if locale
  end
end
