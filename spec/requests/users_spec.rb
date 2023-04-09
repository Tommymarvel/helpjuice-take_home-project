require 'rails_helper'

RSpec.describe 'Users' do
  let(:user) { create(:user, name: 'Test name') }

  describe 'POST /create' do
    before { post users_path, params: { user: { name: user.name } } }

    it 'returns http found as result of the redirection' do
      expect(response).to have_http_status(:found)
    end

    it 'creates a session storing the user id' do
      expect(session[:user_id]).to eq user.id
    end
  end

  describe 'POST /logout' do
    before { delete logout_path }

    it 'returns http found as result of the redirection' do
      expect(response).to have_http_status(:found)
    end

    it 'deletes the user session' do
      expect(session[:user_id]).to be_nil
    end
  end
end
