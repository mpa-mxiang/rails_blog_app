class User < ApplicationRecord
# Define a one-to-many association. In this case, it
# is defining the associations for the `User` model.
  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :likes

  def recent_posts(limit = 3)
    #retrieve the most recent posts for a user.
		posts.order(created_at: :desc).limit(limit)
  end

  def update_posts_counter
    #updating the `posts_counter` attribute of the
		# `User` model with the count of the user's posts. This is useful for keeping track of the number
		# of posts a user has.
		update(posts_counter: posts.count)
  end
end
