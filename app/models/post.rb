class Post < ApplicationRecord
  # defining an association between the `Post`
  # model and the `User` model. It indicates that a `Post` belongs to an `Author`, and the `Author` is
  # an instance of the `User` model.
  belongs_to :author, class_name: 'User'


  # defining associations between the `Post`
  # model and the `Comment` and `Like` models, respectively.
  has_many :comments
  has_many :likes

  def update_user_posts_counter
    # updating the `posts_counter` attribute of
    # the associated `author` object with the count of the `posts` associated with that `author`.
    author.update(posts_counter: author.posts.count)
  end

  def recent_comments
    # List the five last comment on a post
    comments.order(created_at: :desc).limit(5)
  end
end
