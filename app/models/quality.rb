class Quality < ApplicationRecord
  has_many :hot_spring_qualities, dependent: :destroy
  has_many :hot_spring, through: :hot_spring_qualities
end
