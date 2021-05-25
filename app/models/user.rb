class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,uniqueness: true, format: {with:
                      VALID_EMAIL_REGEX, message: "Not a valid email" }
  validates :username, presence: true, length: {minimum: 4, maximum: 20}
  validates :full_name, presence: true, length: {maximum: 30}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tweets, foreign_key: 'author_id', dependent: :destroy
  has_one_attached :photo, dependent: :destroy
  has_one_attached :cover_image, dependent: :destroy
 
  has_many :followers, class_name: 'Following', foreign_key: 'follower_id'
  has_many :followed, class_name: 'Following', foreign_key: 'followed_id'
  
  default_scope -> { includes(:photo_attachment) }

  validates :photo,
                  content_type: { in: %w[image/jpeg image/gif image/png],
                  message: "must be a valid image format" },
                  size:
                  { less_than: 5.megabytes,
                  message:
                  "should be less than 5MB" }
  
  def self.all_users(user_id)
    User.where('id != ?', user_id) 
  end

  
  def email_required?
    false
  end

  def will_save_change_to_email?
    false
  end

  def following?(other_user)
  follows.include?(other_user)
  end
end
