class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:number_id, :last_name, :first_name, :in_charge1, :in_charge2, :in_charge3])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:number_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:number_id])
  end
end
