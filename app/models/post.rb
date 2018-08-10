class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 140}
  validates :body, presence: true
  validates :image, presence: true
end
