require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:all) do
    @user = User.create(
      name: 'Username',
      photo: './userprofilepic.png',
      bio: 'myBio',
      post_count: 0
    )

    @post = Post.create(
      author: @user,
      title: 'My title',
      body: 'My blog with Rails',
      comments_counter: 0,
      likes_counter: 0
    )
  end

  context 'Like methods' do
    it 'update_likes_counter of post' do
      Like.create(author: @user, post: @post)
      expect(@post.likes_counter).to eq 1
    end
  end
end
