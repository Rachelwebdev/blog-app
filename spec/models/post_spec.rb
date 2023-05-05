require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:all) do
    @user = User.create(
      name: 'Rachel',
      photo: './myprofilepic.png',
      bio: 'My Bio',
      post_count: 0
    )
  end
  context 'Validations' do
    it 'checks if title is included' do
      post = Post.new(
        title: 'My blog title',
        author: @user,
        body: 'My first blog post',
        likes_counter: 0,
        comments_counter: 0
      )
      expect(post.valid?).to eq true
    end
    it 'checks if title is not included' do
      post = Post.new(
        author: @user,
        body: 'My first blog post',
        likes_counter: 0,
        comments_counter: 0
      )
      expect(post.valid?).to eq false
    end
    it 'checks the length of the post' do
      test_title = 'a' * 260
      post = Post.new(
        title: test_title,
        author: @user,
        body: 'My first blog post',
        likes_counter: 0,
        comments_counter: 0
      )
      expect(post.valid?).to eq false
    end
    it 'checks the length of the post' do
      test_title = 'a' * 250
      post = Post.new(
        title: test_title,
        author: @user,
        body: 'My first blog post',
        likes_counter: 0,
        comments_counter: 0
      )
      expect(post.valid?).to eq true
    end

    it 'checks if likes_counter is an integer' do
      post = Post.new(
        title: 'My title',
        author: @user,
        body: 'My first blog post',
        likes_counter: 5,
        comments_counter: 0
      )
      expect(post.valid?).to eq true
    end
    it 'checks if likes_counter is greater than or equal to zero' do
      post = Post.new(
        title: 'My title',
        author: @user,
        body: 'My first blog post',
        likes_counter: -3,
        comments_counter: 0
      )
      expect(post.valid?).to eq false
    end

    it 'checks if comments_counter is an integer' do
      post = Post.new(
        title: 'My title',
        author: @user,
        body: 'My first blog post',
        likes_counter: 0,
        comments_counter: 10
      )
      expect(post.valid?).to eq true
    end

    it 'checks if comments_counter is greater than or equal to zero' do
      post = Post.new(
        title: 'My title',
        author: @user,
        body: 'My first blog post',
        likes_counter: 0,
        comments_counter: -2
      )
      expect(post.valid?).to eq false
    end
  end


  context 'post model methods' do
    it 'returns last_five_comments' do
      newpost = Post.create(
        title: 'My Post',
        author: @user,
        body: 'My first blog post',
        likes_counter: 0,
        comments_counter: 0
      )

      7.times { Comment.create(post: newpost, author: @user, body: 'My first comment') }
      expect(newpost.last_five_comments).to match_array(newpost.comments.last(5))
    end

    it 'updates posts_counter' do
      Post.create(
        title: 'another post',
        author: @user,
        body: 'My first blog post',
        likes_counter: 0,
        comments_counter: 0
      )
      expect(@user.post_count).to eq 2
    end
  end
end
