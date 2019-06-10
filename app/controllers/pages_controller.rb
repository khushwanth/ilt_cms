class PagesController < ApplicationController
  def home
    unless current_user
      redirect_to '/users/sign_in'
    end
  end
end
