class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :news
  #belongs_to :article
  #belongs_to :forum
end
