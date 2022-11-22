class Tag < ApplicationRecord
  has_many :hot_spring_tags, dependent: :destroy
  has_many :hot_springs, through: :hot_spring_tags
  
  validates :name, presence:
end
