class Page < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_and_belongs_to_many :categories
  has_many :posts, dependent: :destroy
end
