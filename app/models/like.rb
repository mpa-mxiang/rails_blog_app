class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  # defining callbacks in the `Comment` model.
  after_create :update_likes_counter
  after_destroy :update_likes_counter

  private

  def update_likes_counter
    # updating the `likes_counter` attribute of the
    # associated `post` object with the count of the total number of likes that the post has.
    post.update(LikesCounter: post.likes.count)
  end
end
