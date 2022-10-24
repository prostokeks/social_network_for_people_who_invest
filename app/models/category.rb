class Category < ApplicationRecord

  has_and_belongs_to_many :news
  has_and_belongs_to_many :forums
  has_and_belongs_to_many :articles

end
