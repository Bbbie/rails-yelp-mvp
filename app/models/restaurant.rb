class Restaurant < ApplicationRecord
  # if a restaurant gets destroyed, so are it's reviews
  has_many :reviews, dependent: :destroy

  #validations:
  # A restaurant must have a name, an address and a category
  validates :name, :address, presence: true
  # A restaurant’s category must belong to this fixed list
  validates :category, presence: true, inclusion: { in: ["chinese", "italian", "japanese", "french", "belgian"] }
end
