class Save < ApplicationRecord
  belongs_to :user
  validates :permalink_url, presence: true, allow_blank: false
  validates :user_id, uniqueness: { scope: :permalink_url }
end
