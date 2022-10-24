class Article < ApplicationRecord

  has_one_attached :avatar
  has_many_attached :images
  has_and_belongs_to_many :categories

  belongs_to :user

  default_scope -> { order(created_at: :desc) }

  STATUS=[:passive, :active]

end
