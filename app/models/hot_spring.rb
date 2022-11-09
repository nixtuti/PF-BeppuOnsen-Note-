class HotSpring < ApplicationRecord
  enum running_status: {running: 0, interrupt: 1, closed: 2 }
  
  has_many :reviews
  
  has_one_attached :hot_spring_image
  
  def get_hot_spring_image
    (hot_spring_image.attached?) ? hot_spring_image : 'noimage.png'
  end
  
  validates :name, presence: true
  validates :is_pablished, inclusion: { in: [true, false] }
  
end
