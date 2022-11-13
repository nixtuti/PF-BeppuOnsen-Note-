class Review < ApplicationRecord
  belongs_to :user
  belongs_to :hot_spring
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  has_many_attached :images
  
  validates :title, presence: true
  validates :body, presence: true
  #5段階評価のバリデーション
  validates :rate, presence: true
  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1}, presence: true
    
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
end
