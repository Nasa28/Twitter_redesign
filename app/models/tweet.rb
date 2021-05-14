class Tweet < ApplicationRecord
  belongs_to :users
  validates :text, presence: true, length: {maximum: 200}
end
