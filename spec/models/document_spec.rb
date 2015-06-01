require 'spec_helper'
require 'rails_helper'

describe Document do
  let(:document) { FactoryGirl.create(:document) }

  describe 'validations' do

    it 'should be valid' do
      expect(document).to be_valid
    end

    it 'should be invalid without user_id' do
      document.user_id = nil
      expect(document).not_to be_valid
    end

    it 'should be invalid without content' do
      document.content = nil
      expect(document).not_to be_valid
    end
  end

  describe 'associations' do

    it 'belongs_to user' do
      t = Document.reflect_on_association(:user)
      association = t.macro
      expect(association).to be(:belongs_to)
    end

    it 'has_many word_indices' do
      t = Document.reflect_on_association(:word_indices)
      association = t.macro
      expect(association).to be(:has_many)
    end
  end

  describe 'owned_by_user' do
    let(:user1)    { FactoryGirl.create(:user) }
    let(:user2)    { FactoryGirl.create(:user) }
    let(:document) { FactoryGirl.create(:document, user: user2)}

    it 'should not belong to the first user' do
      expect(document.owned_by_user(user1)).to eq(false)
    end

    it 'should belong to the second user' do
      expect(document.owned_by_user(user2)).to eq(true)
    end
  end

end