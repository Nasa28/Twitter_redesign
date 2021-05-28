class Tweet < ApplicationRecord
  validates :text, presence: true, length: { maximum: 95 }
  belongs_to :author, class_name: 'User'
  has_one_attached :image
  validates :image,
            content_type: { in: %w[image/jpeg image/gif image/png],
                            message: 'must be a valid image format' },
            size:
            { less_than: 6.megabytes,
              message:
            'should be less than 5MB' }
  default_scope -> { includes(:author, image_attachment: :blob) }

  def self.user_tweets
    includes(:author).all.order('created_at DESC')
  end
end
