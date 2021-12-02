class ApplicationController < ActionController::Base
  def country_options(pref_countries)
    country_options = []
    countries = Carmen::Country.all
    codes = pref_countries + countries.sort_by{|c| c.name}.map(&:alpha_2_code)
    codes.each{|c| country_options.push([countries.coded(c).name, c] )}
    country_options.insert(pref_countries.length, ["---------------", "nil"])
  end
end
