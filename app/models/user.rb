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
  has_many :tweets, class_name: 'Tweet', foreign_key: 'author_id'
end
