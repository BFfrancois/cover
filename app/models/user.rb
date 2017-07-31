class User < ApplicationRecord

  has_secure_password

  belongs_to :usertype

  has_many :jobs, dependent: :destroy
  has_many :applications, dependent: :destroy

  has_many :experiences, dependent: :destroy

  has_many :reviews_by, foreign_key: "user_by", class_name: 'Review'
  has_many :reviews_about, foreign_key: "user_about", class_name: 'Review'

  has_many :reviews, foreign_key: "user_by", dependent: :destroy
  has_many :reviews, foreign_key: "user_about", dependent: :destroy


  validates_uniqueness_of :email
  validate :user_validation

  geocoded_by :full_street_address
  after_validation :geocode

  def full_street_address
    "#{street_address}, #{city}, #{province}, #{postal_code}"
  end

  def avg_review_rating
    reviews.average("rating")
  end

  private

  def user_validation
    puts "usertype is #{usertype}"
    if usertype.name == "worker"
      if first_name == ""
        errors.add(:base, "First name can't be empty")
      end
      if last_name == ""
        errors.add(:base, "Last name can't be empty")
      end
      if email == ""
        errors.add(:base, "Email can't be empty")
      end
      if cell == ""
        errors.add(:base, "Cell can't be empty")
      end
      if postal_code == ""
        errors.add(:base, "Postal code can't be empty")
      end
    end
    if usertype.name == "restaurant"
      if restaurant_name == ""
        errors.add(:base, "Restaurant name can't be empty")
      end
      if first_name == ""
        errors.add(:base, "First name can't be empty")
      end
      if last_name == ""
        errors.add(:base, "Last name can't be empty")
      end
      if email == ""
        errors.add(:base, "Email can't be empty")
      end
      if street_address == ""
        errors.add(:base, "Adress can't be empty")
      end
      if city == ""
        errors.add(:base, "City can't be empty")
      end
      if province == ""
        errors.add(:base, "Province can't be empty")
      end
      if postal_code == ""
        errors.add(:base, "Postal code can't be empty")
      end
      if cell == ""
        errors.add(:base, "Cell can't be empty")
      end
    end
  end
end
