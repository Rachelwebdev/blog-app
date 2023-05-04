class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments
  after_save :update_post_count

  def update_post_count
    author.increment!(:post_count)
  end

  def last_five_comments
    comments.order('updated_at: :desc').limit(5)
  end
end
