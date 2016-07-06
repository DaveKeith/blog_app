class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  # has_and_belongs_to_many :comments
  has_many :comment_votes
end
