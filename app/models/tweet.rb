class Tweet < ApplicationRecord
  validates :text, presence: true, length: {maximum: 280}
end
