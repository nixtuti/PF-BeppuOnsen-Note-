class Quality < ApplicationRecord
  has_many :hot_spring_qualities, dependent: :destroy
  has_many :hot_springs, through: :hot_spring_qualities
  has_many :quality_effectes, dependent: :destroy
  has_many :effects, through: :quality_effectes
  
  validates :name, presence: true
end
