require 'rails_helper'

RSpec.describe "notifications/new", type: :view do
  before(:each) do
    assign(:notification, Notification.new(
      :title => "MyString",
      :body => "MyText",
      :image_path => "MyString"
    ))
  end

  it "renders new notification form" do
    render

    assert_select "form[action=?][method=?]", notifications_path, "post" do

      assert_select "input[name=?]", "notification[title]"

      assert_select "textarea[name=?]", "notification[body]"

      assert_select "input[name=?]", "notification[image_path]"
    end
  end
end
