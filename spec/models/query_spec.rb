require 'rails_helper'

RSpec.describe Query do
  let(:query) { build(:query) }

  describe 'validations' do
    context 'when query is blank' do
      it 'is invalid' do
        query.query = ''
        expect(query).not_to be_valid
      end
    end
  end

  describe '@@top_global_searches' do
    it 'returns a hash with the top 5 global searches and frecuency' do
      create_list(:query, 3, query: 'test')
      create_list(:query, 4, query: 'another_test')
      create_list(:query, 2, query: 'yet_another_test')

      global_searches = described_class.top_global_searches

      expect(global_searches.symbolize_keys).to eq({ test: 3, another_test: 4, yet_another_test: 2 })
    end
  end

  describe '@@top_user_searches' do
    let(:user) { create(:user) }

    it 'returns a hash with the top 5 searches for the given user and the frecuency' do
      create_list(:query, 3, query: 'test', user:)
      create_list(:query, 4, query: 'another_test')
      create_list(:query, 2, query: 'yet_another_test', user:)

      user_searches = described_class.top_user_searches(user.id)

      expect(user_searches.symbolize_keys).to eq({ test: 3, yet_another_test: 2 })
    end
  end
end
