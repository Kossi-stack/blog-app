require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.new(name: 'Kossi', bio: 'Formal Civil Engineer', post_counter: 0, photo: 'https://avatars.githubusercontent.com/u/74506933?v=4')

  before(:each) { user.save }

  it 'validates the presence of the name' do
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'validates the presence of the posts_counter' do
    user.post_counter = nil
    expect(user).to_not be_valid
  end

  it 'validates the numericality of the posts_counter' do
    user.post_counter = 'a'
    expect(user).to_not be_valid
  end

  it 'validates the presence of the bio' do
    user.bio = nil
    expect(user).to_not be_valid
  end

  it 'validates the presence of the photo' do
    user.photo = nil
    expect(user).to_not be_valid
  end

  describe '#recent_posts' do
    before(:each) do
      5.times do |i|
        Post.new(title: "Post #{i}", text: "text#{i}", comments_counter: 0, likes_counter: 0, user_id: user.id)
      end
    end

    it 'returns the last 3 posts' do
      expect(user.recents_posts).to eq(Post.order(created_at: :desc).limit(3))
    end
  end
end
