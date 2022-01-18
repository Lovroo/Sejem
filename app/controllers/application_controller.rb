class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  before_action :cor
  def cor
    headers["Access-Control-Allow-Origin"]  = "*"
    headers["Access-Control-Allow-Methods"] = %w{GET POST PUT DELETE}.join(",")
    headers["Access-Control-Allow-Headers"] = %w{Origin Accept Content-Type X-Requested-With X-CSRF-Token}.join(",")
    head(:ok) if request.request_method == "OPTIONS"
  end

  def country_options(pref_countries)
    country_options = []
    countries = Carmen::Country.all
    codes = pref_countries + countries.sort_by{|c| c.name}.map(&:alpha_2_code)
    codes.each{|c| country_options.push([countries.coded(c).name, c] )}
    country_options.insert(pref_countries.length, ["---------------", "nil"])
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :name, :surname, :tel_number, :country, :state, :city, :provider, :uid, :full_name, :avatar_url])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :name, :surname, :tel_number, :country, :state, :city])
  end
end
