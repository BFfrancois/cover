class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :job

  validates :comment, presence: true

end