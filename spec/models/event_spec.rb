require 'rails_helper'

RSpec.describe Event, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :venue }
  end

  context 'associations' do
    it { should have_many(:users_events) }
    it { should have_many(:users).through(:users_events) }
  end
end
