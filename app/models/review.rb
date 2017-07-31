class Review < ApplicationRecord

  belongs_to :users_by, foreign_key: "user_by", class_name: "User"
  belongs_to :users_about, foreign_key: "user_about", class_name: "User"

  validates :user_by, presence: true
  validates :user_about, presence: true
  validates :comment, presence: true
  validates :rating, presence: true,
            numericality: {
                greater_than: 0,
                less_than_or_equal_to: 5
            }

end