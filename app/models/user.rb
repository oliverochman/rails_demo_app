class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :post_likes, through: :posts, source: :likes
end
