class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum sex: { unknown: 0, male: 1, female: 2 }
  
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  has_one_attached :profile_image

  def get_profile_image
    (profile_image.attached?) ? profile_image : 'icon.png'
  end
  
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
    user.password = SecureRandom.urlsafe_base64
    # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    user.username = "ゲスト"
    user.birth_date = Date.today
    user.sex = 0
    end
  end
  
  def age
    today = Time.zone.today
    this_years_birthday = Time.zone.local(today.year, birth_date.month, birth_date.day)
    age = today.year - birth_date.year
    if today < this_years_birthday
      age -= 1
    end
    "#{age} 歳"
  end
  
end
