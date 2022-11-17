class Quality < ApplicationRecord
  has_many :hot_spring_qualities, dependent: :destroy
  has_many :hot_springs, through: :hot_spring_qualities
  has_many :effects, dependent: :destroy
end
