class Event < ApplicationRecord
    has_many :users_events
    has_many :users, through: :users_events
    validates_presence_of :title, :venue
end
