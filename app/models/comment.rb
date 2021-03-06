class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, foreign_key: 'post'

  private

  def update_comments_counter
    post.increment!(:comments_counter)
  end
end
