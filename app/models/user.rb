class User < ApplicationRecord
    has_many :likes, foreign: 'author_id'
    has_many :posts, foreign: 'author_id'
    has_many :comments, foreign: 'author_id'

    def recents_posts
      posts.limit(3).order(created_at: :desc)
    end
end
