class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) do |u|
        u.permit :username, :email, :password, :password_confirmation, :fname, :lname, :user_id, 
        :employee, :employer, :phone_number, :city, :province,  :gender,
        :country, :birthday, :goals, :company_name, :company_address, :field
      end
      devise_parameter_sanitizer.for(:account_update) do |u|
        u.permit :current_password, :username, :email, :password, :password_confirmation, :fname, :lname, :user_id, 
        :employee, :employer, :phone_number, :city, :province,  :gender,
        :country, :birthday, :goals, :company_name, :company_address, :field
      end

    end


  
   private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end
