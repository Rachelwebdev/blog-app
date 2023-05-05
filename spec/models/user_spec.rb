require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validations' do
    it 'checks if name is included' do
      user = User.new(
        name: 'Rachel',
        photo: './myprofilepic.png',
        bio: 'My Bio',
        post_count: 0
      )
      expect(user.valid?).to eq true
    end

    it 'checks if name is not included' do
      user = User.new(
        photo: './myprofilepic.png',
        bio: 'My Bio',
        post_count: 0
      )
      expect(user.valid?).to eq false
    end

    it 'checks if post_counter is an integer' do
      user = User.new(
        name: 'Rachel',
        photo: './myprofilepic.png',
        bio: 'My Bio',
        post_count: 'five'
      )
      expect(user.valid?).to eq false
    end

    it 'checks if post_counter is greater or equal to zero' do
      user = User.new(
        name: 'Rachel',
        photo: './myprofilepic.png',
        bio: 'My Bio',
        post_count: -3
      )
      expect(user.valid?).to eq false
    end
  end

  context 'user model methods' do
    it 'returns last_three_posts' do
      user = User.new(
        name: 'Rachel',
        photo: './myprofilepic.png',
        bio: 'My Bio',
        post_count: -3
      )

      7.times { Post.create(author: user, title: 'amazing post', body: 'My first blog post') }
      expect(user.last_three_posts).to eq user.posts.last(3)
    end
  end
end
