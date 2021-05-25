class Tweet < ApplicationRecord
  validates :text, presence: true, length: {maximum: 200}
  belongs_to :author, class_name: 'User'
  has_one_attached :image
  default_scope -> { includes(:author) }
  def self.user_tweets
    self.includes(:author).all.order('created_at DESC')
  end
  
end
