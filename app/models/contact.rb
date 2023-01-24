class Contact < ApplicationRecord
  
  belongs_to :user
  
  validates :content, presence: true, length: {maximum: 800}

end
