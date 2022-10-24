class Forum < ApplicationRecord

  has_one_attached :avatar

  belongs_to :user
  has_and_belongs_to_many :categories
  #has_many :comments

  default_scope -> { order(created_at: :desc) }

  STATUS=[:passive, :active]

  #validates :status, inclusion: {in: Forum::STATUS}
end