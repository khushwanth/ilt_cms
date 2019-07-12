class UserEventsController < ApplicationController

    def index
        @join_user = UsersEvent.new(user_id: current_user.id, event_id: params[:eid])
        # TODO: needs validation
        if Event.find(params[:eid]).current_joinees < Event.find(params[:eid]).capacity
            if @join_user.save()
                Event.find(params[:eid]).update_column(:current_joinees, Event.find(params[:eid]).current_joinees + 1)
                redirect_to events_path
            end
        else
            flash[:alert] = 'Sorry, the event capacity is full. You cannot join this event.'
            redirect_to events_path
        end
    end

    def new
        @withdraw_user = UsersEvent.where(user_id: params[:uid], event_id: params[:eid])
        if UsersEvent.destroy(@withdraw_user.first.id)
            Event.find(params[:eid]).update_column(:current_joinees, Event.find(params[:eid]).current_joinees - 1)
            redirect_to events_path
        end
    end
end