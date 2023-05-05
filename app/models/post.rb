class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments
  after_save :update_post_count

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0
  }
  validates :likes_counter, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0
  }

  def update_post_count
    author.increment!(:post_count)
  end

  def last_five_comments
    comments.order(created_at: :desc).limit(5)
  end
end
