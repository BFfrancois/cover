class Jobtype < ApplicationRecord

  has_many :jobs, dependent: :destroy
  has_many :experiences, dependent: :destroy

end
