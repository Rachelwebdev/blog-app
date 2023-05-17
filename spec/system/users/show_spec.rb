require 'rails_helper'

RSpec.describe 'users/show', type: :feature do
  before(:each) do
    @users = [
      User.create(
        name: 'Tom',
        photo: 'https://i0.wp.com/imgs.hipertextual.com/wp-content/uploads/2022/10/Andor_Luthen-Rael.png',
        bio: 'Software Developer from Nigeria',
        post_count: 2
      ),
      User.create(
        name: 'Jerry',
        photo: 'https://i0.wp.com/imgs.hipertextual.com/wp-content/uploads/2022/06/obi-wan-kenobi-2-1-scaled.jpeg',
        bio: 'Software Developer from South Africa', post_count: 3
      )
    ]

    @first_user = User.last

    @post1 = Post.create(author: @first_user, title: 'Hello', body: 'This is my second test post',
                         comments_counter: 2, likes_counter: 6)
    @post2 = Post.create(author: @first_user, title: 'My second post',
                         body: 'Yeah, this is a new post for the first user', comments_counter: 0, likes_counter: 3)
    @post3 = Post.create(author: @first_user, title: 'My third post', body: 'Added a new post', comments_counter: 4,
                         likes_counter: 1)

    visit user_path(@first_user)
  end

  it "shows the user's profile picture" do
    img = page.all('img')
    expect(img.size).to eq(1)
  end

  it 'shows the users name' do
    expect(page).to have_content(@first_user.name)
  end

  it 'shows the number of post the user has written' do
    expect(page).to have_content(@first_user.post_count)
  end

  it 'shows the users bio' do
    expect(page).to have_content(@first_user.bio)
  end

  it 'shows the users first three post' do
    expect(page).to have_content(@post1.body)
    expect(page).to have_content(@post2.body)
    expect(page).to have_content(@post3.body)
  end

  it 'shows a button to view all users posts' do
    expect(page).to have_content('See all posts')
  end

  it 'redirects to the posts show page when I click on a user' do
    visit user_posts_path(@first_user)
    click_link @post3.title
    expect(current_path).to match user_posts_path(@first_user.id)
  end

  it 'redirects to the user\'s post index page when I click to see all posts' do
    click_link 'See all posts'
    expect(current_path).to eql user_posts_path(@first_user)
  end
end