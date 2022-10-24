class News < ApplicationRecord

  has_one_attached :avatar

  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :news_comments

  default_scope -> { order(created_at: :desc) }

end
