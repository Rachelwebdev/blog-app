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
