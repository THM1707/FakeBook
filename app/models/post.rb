class Post < ApplicationRecord
  has_and_belongs_to_many :categories
  belongs_to :page
  has_many :saves
  has_many :users, through: :saves, dependent: :destroy
  validates :fb_id, uniqueness: true
end
