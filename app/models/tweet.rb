class Tweet < ApplicationRecord
  belongs_to :users
  belongs_to :author, class_name: 'User'
  validates :text, presence: true, length: { maximum: 240 }
end
