require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation' do
    it 'test full_name presence' do
      user = User.new(username: 'Nasa', full_name: ' ', email: 'kalu@gmail.com', password: '123456').save
      expect(user).to eq(false)
    end

    it 'test username presence' do
      user = User.new(username: ' ', full_name: 'Kalu chinasa ', email: 'kalu@gmail.com', password: '123456').save
      expect(user).to eq(false)
    end
    it 'test email address presence' do
      user = User.new(username: 'Nasa', full_name: ' Kalu chinasa', email: '', password: '123456').save
      expect(user).to eq(false)
    end

    it 'test password presence' do
      user = User.new(username: 'Nasa', full_name: 'Kalu chinasa ', email: 'kalu@gmail.com', password: '').save
      expect(user).to eq(false)
    end

    it 'test password length ' do
      user = User.new(username: 'Nasa', full_name: 'Kalu chinasa ', email: 'kalu@gmail.com', password: '12345').save
      expect(user).to eq(false)
    end
  end
  context 'user validations' do
    it 'test username length ' do
      user = User.new(username: 'Nasaagukaluagu', full_name: 'chinasa agu', email: 'kalu@gmail.com',
                      password: '123567').save
      expect(user).to eq(false)
    end

    it 'test full_name length ' do
      user = User.new(username: 'Nasa', full_name: 'chinasa david chukwuemeka agu', email: 'kalu@gmail.com',
                      password: '123567').save
      expect(user).to eq(false)
    end

    it 'should save successfully ' do
      user = User.new(username: 'chinasass', full_name: 'Chinasa Kalu', email: 'kaluu@gmail.com',
                      password: '1234567').save
      expect(user).to eq(true)
    end
  end

  context 'image and photo validations' do
    it { is_expected.to validate_content_type_of(:photo).allowing('image/jpeg', 'image/png', 'image/gif') }

    it { is_expected.to validate_size_of(:photo).less_than(6.megabytes) }

    it { is_expected.to validate_content_type_of(:cover_image).allowing('image/jpeg', 'image/png', 'image/gif') }

    it { is_expected.to validate_size_of(:cover_image).less_than(6.megabytes) }
  end

  context 'Association Test' do
    it 'should have many tweet' do
      user = User.reflect_on_association(:tweets).macro
      expect(user).to eq(:has_many)
    end

    it 'should have many followers' do
      user = User.reflect_on_association(:followers).macro
      expect(user).to eq(:has_many)
    end

    it 'should have many followers' do
      user = User.reflect_on_association(:followed).macro
      expect(user).to eq(:has_many)
    end
  end
end
