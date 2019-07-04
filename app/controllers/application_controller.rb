class ApplicationController < ActionController::Base
    include Pundit

rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :designation, :address, :phone, :flyer, :avatar) }
    end

    def user_not_authorized
        redirect_to @notification, alert: 'You are NOT authorized for this action.' 
    end

end
