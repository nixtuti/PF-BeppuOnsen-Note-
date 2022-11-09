class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum sex: { male: 0, female: 1 }
  enum status: { active: 0, invalid: 1, forced_invalid: 2 }, _prefix: true
  
  
  
  
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
  
end
