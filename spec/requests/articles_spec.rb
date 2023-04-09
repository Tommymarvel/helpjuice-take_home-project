require 'rails_helper'

RSpec.describe '/articles' do
  let(:article) { create(:article) }

  describe 'GET /articles' do
    before { get articles_url }

    it 'renders a successful response' do
      expect(response).to be_successful
    end
  end
end
