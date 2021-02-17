class Review < ApplicationRecord
  # A review must belong to a restaurant.
  belongs_to :restaurant

  #validations
  # A review must have content and a rating.
  validates :content, :rating, presence: true
  # A review’s rating must be a number between 0 and 5.
  validates :rating, inclusion: { in: (0..5) }, numericality: { only_integer: true }
end
