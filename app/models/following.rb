class Following < ApplicationRecord
  belongs_to :follower, class_name: 'User', foreign_key: 'follower_id'
  belongs_to :followed, class_name: 'User', foreign_key: 'followed_id'
  validates :follower_id, presence: true
  validates :followed_id, presence: true
end
