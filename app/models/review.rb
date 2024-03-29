class Review < ApplicationRecord
  belongs_to :user
  belongs_to :hot_spring
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many_attached :images

  validates :title, presence: true, length: {minimum: 2, maximum: 50 }
  validates :body, presence: true, length: {maximum: 500}
  validates :hot_spring_id, presence: true
  validates :user_id, presence: true
  
  #デフォルトを指定しているので記載したら不具合が出る
  #validates :is_pablished, presence: true
  
  #5段階評価のバリデーション
  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1,
    message: 'を星の数でつけてください'}


  #ユーザーによっていいねがされているかの判定
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end


end
