require 'rails_helper'

RSpec.describe UsersEvent, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:event) }
  end
end
