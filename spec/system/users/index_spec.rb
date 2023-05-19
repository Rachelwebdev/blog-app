require 'rails_helper'

RSpec.describe 'users/index', type: :feature do
  before(:each) do
    @user1 =
      User.create(
        name: 'Tom',
        photo: 'https://images.unsplash.com/photo-1510915228340-29c85a43dcfe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
        bio: 'Software Developer from Nigeria',
        post_count: 2
      )

    @user2 = User.create(
      name: 'Jerry',
      photo: 'https://images.unsplash.com/photo-1510915228340-29c85a43dcfe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      bio: 'Software Developer from South Africa', post_count: 3
    )
    @users = User.all
    visit '/users'
  end

  it 'shows the name of all users' do
    @users.each do |user|
      expect(page).to have_content(user.name)
    end
  end

  it 'display the profile picture for each user' do
    @users.each do |user|
      expect(page).to have_selector("img[src='#{user.photo}']")
    end
  end

  it 'displays number of posts each user has written' do
    @users.each do |user|
      expect(page).to have_content "Number of posts: #{user.post_count}"
    end
  end

  it 'redirects to to a users show page when a user is clicked' do
    click_on @user2.name
    expect(page).to have_current_path user_path(user2.id)
  end
end
