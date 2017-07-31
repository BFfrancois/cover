class Job < ApplicationRecord

  belongs_to :user
  belongs_to :jobtype
  has_many :applications, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :start_time,
            :end_time,
            :rate,
            presence: true

  

  def self.search(search)
    if search
      joins(:jobtype, :user).where(
        'cast(start_time as text) LIKE ?
         OR cast(end_time as text) LIKE ?
          OR cast(rate as text) LIKE ?
            OR users.restaurant_name LIKE ?
              OR jobtypes.name LIKE ?
                  OR jobs.description LIKE ?', 
                  "%#{search}%", 
                  "%#{search}%", 
                  "%#{search}%",
                  "%#{search}%",
                  "%#{search}%", 
                  "%#{search}%")
    else
      all
    end
  end

end