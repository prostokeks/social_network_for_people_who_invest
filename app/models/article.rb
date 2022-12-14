class Article < ApplicationRecord

  has_one_attached :avatar
  has_many_attached :images

  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :article_comments

  default_scope -> { order(created_at: :desc) }

  STATUS=[:passive, :active]

  validates :title, :body, presence: true


end
