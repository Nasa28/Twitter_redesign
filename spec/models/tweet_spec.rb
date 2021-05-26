require 'rails_helper'

RSpec.describe Tweet, type: :model do
  context 'Validations' do
    it 'Test text presence' do
      tweet = Tweet.new(text: ' ').save
      expect(tweet).to eq(false)
    end
    it 'Test text length' do
      tweet = Tweet.new(text: ' I dont agree with the concept of moving validation to the controller controllers are hardly being tested and I dont believe that validations should be part of integration tests but rather unit tests. In my opinion, it is better to keep any validation efforts in the model whenever possible and perhaps ad some sort of client-side validation for usability purposes. But keep your controllers slim by all means - you will thank yourself in the').save
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
