class UserEventsController < ApplicationController

    def create
        @join_user = UserEvent.new(uid: current_user.id, eid: params[:eid])
        if @join_user.save(validate: false)
            redirect_to events_path
        end
    end
end
