class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :news
  has_many :forums

  WORKGROUP=["User", "Moderator", "Admin"]
  GENDER=["Male", "Female"]

end
