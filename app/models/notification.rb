class Notification < ApplicationRecord
    has_one_attached :flyer
    validates_presence_of :title
end
