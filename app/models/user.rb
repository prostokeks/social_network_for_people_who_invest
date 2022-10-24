class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :news
  has_many :forums
  has_many :articles
  has_many :article_comments
  has_many :news_comments
  has_many :forum_comments

  WORKGROUP=["User", "Moderator", "Admin"]
  GENDER=["Male", "Female"]

end
