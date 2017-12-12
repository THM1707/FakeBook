class Post < ApplicationRecord
  has_and_belongs_to_many :categories
  belongs_to :page
  validates :fb_id, uniqueness: true
end
