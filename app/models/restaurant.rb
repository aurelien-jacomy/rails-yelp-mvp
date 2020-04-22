class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :category, presence: true, inclusion: {
    in: ["chinese", "italian", "japanese", "french", "belgian"],
    message: "%{value} is not a valid category"
  }
  validates :address, presence: true

  def rating
    sum_ratings = Review.where(restaurant: self).sum(:rating)
    number_of_ratings = Review.where(restaurant: self).count
    sum_ratings.fdiv(number_of_ratings).round(1)
  end
end
