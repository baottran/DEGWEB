class Inquiry < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :name, presence: true
  validates :title, presence: true
  validates :shop_name, presence: true
  validates :address_1, presence: true
  validates :address_2, presence: true
  validates :city, presence: true
  validates :zip_code, presence: true
  validates :state, presence: true
  validates :phone, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, 
                    length: { maximum: 255 }, 
                    format: { with: VALID_EMAIL_REGEX }
                    
  validates :make, presence: true
  validates :model, presence: true
  validates :year, presence: true
  validates :body_type, presence: true
  validates :vin, presence: true
  validates :database, presence: true
  validates :inquiry_type, presence: true

  has_attached_file :attachment 

  validates_attachment :attachment, content_type: { content_type: /\Aimage\/.*\Z/ }
end
