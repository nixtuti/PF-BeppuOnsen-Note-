class HotSpring < ApplicationRecord
  enum running_status: {running: 0, interrupt: 1, closed: 2 }

  has_many :reviews, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :visited_marks, dependent: :destroy
  has_many :hot_spring_qualities, dependent: :destroy
  has_many :qua, through: :hot_spring_qualities


  has_one_attached :hot_spring_image

  def get_hot_spring_image
    (hot_spring_image.attached?) ? hot_spring_image : 'noimage.png'
  end

  validates :name, presence: true
  validates :is_pablished, inclusion: { in: [true, false] }
  
  def bookmarked_by?(user)
    bookmarks.exists?(user_id: user.id)
  end
  
  def visited_by?(user)
    visited_marks.exists?(user_id: user.id)
  end
end
