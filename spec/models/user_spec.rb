require 'rails_helper'

RSpec.describe User do
  let(:user) { build(:user) }

  describe 'validations' do
    context 'when name is blank' do
      it 'is invalid' do
        user.name = ''
        expect(user).not_to be_valid
      end
    end
  end
end
