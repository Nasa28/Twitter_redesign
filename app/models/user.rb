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


  def email_required?
    false
  end

  def will_save_change_to_email?
    false
  end

  def followings?(other_user)
  followed.include?(other_user)
  end
end
