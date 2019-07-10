require 'rails_helper'

RSpec.describe Notification, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  # it 'is valid with valid attributes' do  
  #   expect(Notification.new).to be_valid
  # end

  # it 'is not valid without a title' do
  #   notification = Notification.new(title: nil)
  #   expect(notification).to_not_be_valid
  # end

  context 'validations' do
    it { should validate_presence_of :title }
  end
end
