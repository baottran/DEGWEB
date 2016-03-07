class Inquiry < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :name, presence: true
  validates :phone, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true,
                    length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }

  validates :make, presence: true
  validates :model, presence: true
  validates :year, presence: true
  validates :vin, presence: true

  has_attached_file :attachment,
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials },
                    :path => "/inquiries/:id",
                    :url => ":s3_domain_url"

  after_initialize :init

  def init
    self.status  ||= "Recieved by DEG"          #will set the default value only if it's nil
  end

  def s3_credentials
    {:bucket => "degweb-dev", :access_key_id => "AKIAJI4FS6CKOUH3A7JQ", :secret_access_key => "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"}
  end

  validates_attachment :attachment, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}

end
