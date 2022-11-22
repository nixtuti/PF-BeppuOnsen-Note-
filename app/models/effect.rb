class Effect < ApplicationRecord
  has_many :quality_effectes, dependent: :destroy
  has_many :qualities, through: :quality_effectes

  validates :name, presence: true

end