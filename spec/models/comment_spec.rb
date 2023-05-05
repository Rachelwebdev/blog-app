require 'rails_helper'

RSpec.describe Comment, type: :model do
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


  context 'comments methods' do
    it 'update_comments_counter of post' do
      Comment.create(author: @user, post: @post, body: 'nice post')
      expect(@post.comments_counter).to eq 1
    end
  end
end
