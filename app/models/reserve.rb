class Reserve < ApplicationRecord
  belongs_to :car
  belongs_to :user
  validates :car_id, presence: true
  validates :user_id, presence: true
end
