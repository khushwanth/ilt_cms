FactoryGirl.define do
    factory :notification do
        title 'New Notification'
        body 'This is a test notification generated'
        image_path 'notifs/images/image.png'
    end
end
