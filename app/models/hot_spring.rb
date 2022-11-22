class HotSpring < ApplicationRecord
  enum running_status: {running: 0, interrupt: 1, closed: 2 }

  has_many :reviews, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :visited_marks, dependent: :destroy
  has_many :hot_spring_qualities, dependent: :destroy
  has_many :qualities, through: :hot_spring_qualities
  has_many :hot_spring_tags, dependent: :destroy
  has_many :tags, through: :hot_spring_tags


  has_one_attached :hot_spring_image

  def get_hot_spring_image
    (hot_spring_image.attached?) ? hot_spring_image : 'noimage.png'
  end

  validates :name, presence: true, uniqueness: true
  validates :introduction, presence: true, length: {maximum: 200}
  validates :address, presence: true
  validates :price, presence: true
  validates :private_bath_price, presence: true
  validates :hours, presence: true
  validates :holiday, presence: true
  validates :parking, presence: true
  validates :contact, presence: true
  validates :running_status, presence: true
  validates :is_pablished, inclusion: { in: [true, false] }
  validates :hot_spring_qualities, presence: true
  
  
  scope :latest, -> {order(created_at: :desc)}
  scope :oldest, -> {order(created_at: :asc)}
  scope :rate_avg, -> {eager_load(:reviews).group("hot_springs.id").order("avg(reviews.rate) desc")}
  scope :review_amount, -> {eager_load(:reviews).group("hot_springs.id").order("count(hot_springs.id) desc")}
  
  def bookmarked_by?(user)
    bookmarks.exists?(user_id: user.id)
  end

  def visited_by?(user)
    visited_marks.exists?(user_id: user.id)
  end
  
  def self.looks(search)
    HotSpring.where("name LIKE?","%#{search}%")
  end

end
