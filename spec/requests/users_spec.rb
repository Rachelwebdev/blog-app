require 'rails_helper'

describe 'GET /users' do
  it 'returns a successful response' do
    get '/users'

    expect(response).to be_successful
    expect(response.body).to include('<h1>This is a list of all Users</h1>')
    expect(response).to render_template(:index)
  end
end

describe 'GET /users/:id' do
  it 'returns a successful response' do
    user = User.create!(name: 'Test User', post_count: 0)
    get "/users/#{user.id}"

    expect(response).to be_successful
    expect(response.body).to include('<h1>This is a single user</h1>')
    expect(response).to render_template(:show)
  end
end

# RSpec.describe UsersController, type: :request do
#   describe 'GET /index' do
#     it 'returns a successful http request and renders the index template' do
#       get root_path
#       expect(response).to have_http_status(200)
#       expect(response).to render_template(:index)
#     end

#     it 'includes the correct text in the index body' do
#       get root_path
#       expect(response.body).to include('This is a list of all Users')
#     end
#   end

#   describe 'GET /show' do

#     user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0)

#     it 'returns a successful http request and renders the index template' do
#       user = User.create(name: 'Rachel', id: '001')
#       get user_path(user)
#       expect(response).to have_http_status(200)
#       expect(response).to render_template(:show)
#     end

#     it 'includes the correct text in the response body' do
#       user = User.create(name: 'Chris', id: '001')
#       get user_path(user)
#       expect(response.body).to include('This is a single user')
#     end
#   end
# end
