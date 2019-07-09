FactoryGirl.define do
    factory :event do
        title 'New Event'
        event_date Date.today
        start_time Time.now
        end_time Time.now
        venue 'CST'
    end
end
