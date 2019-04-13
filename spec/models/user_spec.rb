require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#full_name' do
    it 'concatenates first and last name' do
      user = User.new(first_name: 'Kenny', last_name: 'Loggins')
      expect(user.full_name).to eq('Kenny Loggins')
    end
  end
end
