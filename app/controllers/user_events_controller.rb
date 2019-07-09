class UserEventsController < ApplicationController

    def index
        @join_user = UsersEvent.new(user_id: current_user.id, event_id: params[:eid])
        if @join_user.save()
            redirect_to events_path
        end
    end

    def new
        @withdraw_user = UsersEvent.where(user_id: params[:uid], event_id: params[:eid])
        if UsersEvent.destroy(@withdraw_user.first.id)
            redirect_to events_path
        end
    end
end