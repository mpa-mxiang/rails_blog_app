class User < ApplicationRecord
  # Define a one-to-many association. In this case, it
  # is defining the associations for the `User` model.
  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id

  # validating that the `Name` attribute of the `User`
  # model is present, meaning it cannot be blank or nil.
  validates :Name, presence: true

  validates :PostCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true

  def recent_posts(limit = 3)
    # retrieve the most recent posts for a user.
    posts.order(created_at: :desc).limit(limit)
  end

  def update_posts_counter
    # updating the `posts_counter` attribute of the
    # `User` model with the count of the user's posts. This is useful for keeping track of the number
    # of posts a user has.
    update(PostCounter: posts.count)
  end
end
