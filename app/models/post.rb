class Post < ApplicationRecord
  has_and_belongs_to_many :categories
  belongs_to :page
  validates :fb_id, uniqueness: true

  def in_category?(keywords)
    result = false
    keywords.each do |k|
      if message.include?(k)
        result = true
        break
      end
    end
    result
  end
end
