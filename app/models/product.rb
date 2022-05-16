class Product < ApplicationRecord
  validates_presence_of :name, :size, :price
  has_many :ratings
  has_one_attached :image

  def rating
    ratings.pluck(:score).sum / ratings.length
  end
end
