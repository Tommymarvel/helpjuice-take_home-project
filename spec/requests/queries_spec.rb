require 'rails_helper'

RSpec.describe 'Queries' do
  describe 'POST articles/search' do
    let(:user) { create(:user) }

    # Login first
    before { post users_path, params: { user: { name: user.name } } }

    it 'returns http success' do
      post search_articles_path, params: { query: 'some_query', finished: 'false' }
      expect(response).to have_http_status(:success)
    end

    context 'when finished is true' do
      it 'creates a query' do
        post search_articles_path, params: { query: 'some_query', finished: 'true' }
        expect(user.queries.size).to eq 1
      end
    end

    context 'when finished is true and query is blank' do
      it "doesn't create a query" do
        post search_articles_path, params: { query: '', finished: 'true' }
        expect(user.queries.size).to eq 0
      end
    end
  end
end
