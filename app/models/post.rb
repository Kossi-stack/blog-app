class Post < ApplicationRecord
    belongs_to :author, foreign_key: 'User'
    has_many :comments, foreign_key: 'post_id'
    has_many :likes, foreign_key: 'post_id'

    def update_post_counter 
      user.increment!(:posts_counter)
    end

    def recent_comments
      comments.limt(5).order(created_at: :desc)
    end
end