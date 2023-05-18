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

    visit '/users'
  end


  it 'shows the name of all users' do
    expect(page).to have_content('Jerry')
  end

  it 'display the profile picture for each user' do
    expect(page).to have_selector("img[src='#{@user2.photo}']")
  end
  Please kindly add the test to this file spec / system / users / index_spec.rb

  it 'displays number of posts each user has written' do
    expect(page).to have_content "Number of posts: #{@user2.post_count}"
  end

  it 'redirects to to a users show page when a user is clicked' do
    click_on @user2.name
    expect(page).to have_current_path user_path(@user2.id)
  end
end
