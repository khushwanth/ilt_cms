class Event < ApplicationRecord
    has_many :users_events
    has_many :users, through: :users_events, dependent: :destroy
    validates_presence_of :title, :venue, :capacity
end
