class Article < ApplicationRecord
  belongs_to :user
  has_many :good, dependent: :destroy
  has_many :gooders, through: :good, source: :user

  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true, length: { maximum: 1000 }

end
