require 'rails_helper'

describe 'GET all posts for an user' do
  let(:user) { User.create!(name: 'Test User', post_count: 0) }

  it 'returns a successful response' do
    get "/users/#{user.id}/posts"

    expect(response).to be_successful
    expect(response.body).to include('<h1>Here is a list of posts for a given user</h1>')
    expect(response).to render_template(:index)
  end
end

describe 'GET specific post for a user' do
  let(:user) { User.create!(name: 'Test User', post_count: 0) }

  it 'returns a successful response' do
    post = Post.create!(title: 'Test Post', author_id: user.id, comments_counter: 0, likes_counter: 0)
    get "/users/#{user.id}/posts/#{post.id}"

    expect(response).to be_successful
    expect(response.body).to include('<h1>This is a single post</h1>')
    expect(response).to render_template(:show)
  end
end

# RSpec.describe PostsController, type: :request do

#   before(:all) do
#     @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0)
#   end

#     describe 'GET /index' do
#     it 'returns a successful http request and renders the index template' do
#       get user_posts_path(user_id: 1)
#       expect(response).to have_http_status(200)
#       expect(response).to render_template(:index)
#     end

#     it 'includes the correct text in the index body' do
#       get user_posts_path(user_id: 1)
#       expect(response.body).to include('Here is a list of posts for a given user')
#     end
#   end

#    describe 'GET /show' do

#     post = Post.create(author: @user, title: 'Hello', text: 'This is my first post', likes_counter: 0,     comments_counter: 0)

#     it 'returns a successful http request and renders the index template' do
#       post = Post.create(title: 'Test Title', id: 1)
#       get user_post_path(user_id: 1, id: post.id)
#       expect(response).to have_http_status(200)
#       expect(response).to render_template(:show)
#     end

#     it 'includes the correct text in the response body' do
#       post = Post.create(title: 'Test Title', id: 1)
#       get user_post_path(user_id: 1, id: post.id)
#       expect(response.body).to include('This is a single post')
#     end
#   end
# end
