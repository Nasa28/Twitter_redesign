require 'rails_helper'

RSpec.describe Tweet, type: :model do
  context 'Validations' do
    it 'Test text presence' do
      tweet = Tweet.new(text: ' ').save
      expect(tweet).to eq(false)
    end
    it 'Test text length' do
      tweet = Tweet.new(text: ' I dont agree with the concept of moving validation to the controller controllers ').save
      expect(tweet).to eq(false)
    end
    it { is_expected.to validate_content_type_of(:image).allowing('image/jpeg', 'image/png', 'image/gif') }

    it { is_expected.to validate_size_of(:image).less_than(2.megabytes) }
  end
  context 'Association Test' do
    it 'should belong to author' do
      tweet = Tweet.reflect_on_association(:author).macro
      expect(tweet).to eq(:belongs_to)
    end
  end
end
