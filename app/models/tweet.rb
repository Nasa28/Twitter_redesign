class Tweet < ApplicationRecord
  validates :text, presence: true, length: {maximum: 200}
  belongs_to :author, class_name: 'User'
end
