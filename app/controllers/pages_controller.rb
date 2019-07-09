class PagesController < ApplicationController
  def home
    unless current_user
      redirect_to '/users/sign_in'
    end
    @members = User.where(admin: false).count
    @admins = User.where(admin: true).count
    @news = Notification.count
    @events = Event.count
    @next_event = Event.where("event_date > ?", Date.today).order(:event_date).first
  end
end
