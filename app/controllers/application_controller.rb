class ApplicationController < ActionController::Base
  #before_action :authenticate_user!, except: [:top, :about]

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  #def after_sign_in_path_for(resource)
	  #customers_show_path
  #end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code ,:address, :telephone_number])
  end
end