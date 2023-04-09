require 'rails_helper'

RSpec.describe Article do
  let(:article) { build(:article) }

  describe 'validations' do
    context 'when the title is blank' do
      it 'is invalid' do
        article.title = ''
        expect(article).not_to be_valid
      end
    end

    context 'when the text is blank' do
      it 'is invalid' do
        article.text = ''
        expect(article).not_to be_valid
      end
    end
  end
end
