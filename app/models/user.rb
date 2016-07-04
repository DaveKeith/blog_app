class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, uniqueness: true,
    format: {
      with: /.+\@.+\..+/,
      message: "must have an @ symbol and period"
    }

  has_many :posts
  has_many :comments
  has_many :post_votes
  has_many :comment_votes
end
