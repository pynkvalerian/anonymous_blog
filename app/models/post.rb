class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, presence: true

  has_many :post_tags
  has_many :tags, through: :post_tags

end
