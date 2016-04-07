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

  after_initialize :init, :set_criteria

  after_save :set_criteria

  def init
    self.status  ||= "Received by DEG"          #will set the default value only if it's nil
  end

  def set_criteria

    search_data = "#{year} #{make} #{model} #{inquiry_type} "

    if inquiry_type === 'Missing Information'

      search_data = search_data + "#{missing_part_name} #{missing_part_description} #{missing_issue_summary} #{missing_area_of_vehicle} #{missing_area_of_vehicle_other_field}"

    elsif inquiry_type === 'Parts'

      search_data = search_data + "#{parts_area_of_vehicle} #{parts_area_of_vehicle_other_field} #{parts_part_name} #{parts_part_description} #{parts_issue_summary} #{parts_suggested_action}"

    elsif inquiry_type === "Procedure Page Issue"
      
      search_data = search_data + "#{procedure_area_of_vehicle} #{procedure_area_of_vehicle_other_field} #{procedure_issue_summary}"

    elsif inquiry_type === 'Welded Panel Operations'

      search_data = search_data + "#{welded_area_of_vehicle} #{welded_area_of_vehicle_other_field} #{welded_part_name} #{welded_issue_summary}"

    elsif inquiry_type === 'Non-Welded Panel Operations'

      search_data = search_data + "#{non_welded_area_of_vehicle} #{non_welded_area_of_vehicle_other_field} #{non_welded_part_name} #{non_welded_issue_summary}"

    elsif inquiry_type === 'Refinish Operations'

      search_data = search_data + "#{refinished_area_of_vehicle} #{refinished_area_of_vehicle_other_field} #{refinished_issue_summary}"

    elsif inquiry_type === 'All Other'

      search_data = search_data + "#{all_other_issue_summary}"

    end
          
    self.search_criteria = search_data.downcase
  end


  def s3_credentials
    {:bucket => "degweb-dev", :access_key_id => "AKIAJI4FS6CKOUH3A7JQ", :secret_access_key => "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"}
  end

  def time_to_resolve_days

    if resolution_date!= nil 
      resolution_time_days = (resolution_date - created_at) / 86400
      return "#{resolution_time_days.round(2)} days"
    end
  end


  validates_attachment :attachment, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}

end
