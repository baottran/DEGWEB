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

  has_attached_file :attachment2,
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials },
                    :path => "/inquiries/:id", 
                    :url => ":s3_domain_url"

  has_attached_file :attachment3,
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials },
                    :path => "/inquiries/:id", 
                    :url => ":s3_domain_url"

  has_attached_file :attachment4,
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials },
                    :path => "/inquiries/:id", 
                    :url => ":s3_domain_url"

    has_attached_file :attachment5,
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials },
                    :path => "/inquiries/:id", 
                    :url => ":s3_domain_url"               

  after_initialize :init, :set_criteria, :set_area_of_vehicle

  after_save :set_criteria, :set_area_of_vehicle

  scope :ccc, -> { where(database: "CCC") }
  scope :mitchell, -> { where(database: "Mitchell") }
  scope :audatex, -> { where(database: "Audatex") }

  def init
    self.status  ||= "Received by DEG"
    self.show_on_web = false           #will set the default value only if it's nil
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

  def self.search(search)
    inquiries = Inquiry.all 

    if search 
      inquiries.where(['search_criteria LIKE ?', "%#{search.downcase}%"])
    else
      inquiries
    end
    
  end

  def s3_credentials
    {:bucket => ENV["aws_bucket"], :access_key_id => ENV["aws_access_key_id"], :secret_access_key => ENV["aws_secret_access_key"]}
  end

  def time_to_resolve_days

    if resolution_date!= nil 
      resolution_time_days = (resolution_date - created_at) / 86400
      return "#{resolution_time_days.round(0)} days"
    end
  end

  def description_tooltip

    case inquiry_type

    when 'Missing Information'
      return "Area of Vehicle
              #{missing_area_of_vehicle}
              
              Missing Part Name
              #{missing_part_name}
              
              Missing Part Description
              #{missing_part_description}"


    when 'Parts'
      return "Area of Vehicle
              #{parts_area_of_vehicle}

              Part Name
              #{parts_part_name}

              OEM Part Number
              #{parts_oem_part_number}

              Issue Summary 
              #{parts_issue_summary}

              Suggested Action 
              #{parts_suggested_action}"

    when "Procedure Page Issue"

      return "Area of Vehicle
              #{procedure_area_of_vehicle}

              Page #
              #{procedure_page_number}

              Issue Summary 
              #{procedure_issue_summary}

              Suggested Action
              #{procedure_suggested_action}"

    when 'Welded Panel Operations'

      return "Area of Vehicle
              #{welded_area_of_vehicle}

              Part Name
              #{welded_part_name}

              Issue Summary
              #{welded_issue_summary}

              Individual Procedure Steps
              #{welded_procedure_steps}

              Technician Skill Level
              #{welded_skill_level}

              Actual Time To Complete
              #{welded_complete_time_hour} #{non_welded_complete_time_min}

              Suggested Action
              #{welded_suggested_action}"

    when 'Non-Welded Panel Operations'
      return "Area of Vehicle
              #{non_welded_area_of_vehicle}

              Part Name
              #{non_welded_part_name}

              Issue Summary
              #{non_welded_issue_summary}

              Individual Procedure Steps
              #{non_welded_procedure_steps}

              Technician Skill Level
              #{non_welded_skill_level}

              Actual Time To Complete
              #{non_welded_complete_time_hour} #{non_welded_complete_time_min}

              Suggested Action
              #{non_welded_suggested_action}"

    when 'Refinish Operations'
      return "Area of Vehicle
              #{refinished_area_of_vehicle} #{refinished_area_of_vehicle_other_field}

              Issue Summary
              #{refinished_issue_summary}

              Special Labor or Material Considerations
              #{refinished_special_labor}

              Estimated Part Surface Area
              #{refinished_surface_area} square inches

              Suggested Action
              #{refinished_suggested_action}"

    when 'All Other'
      return "Issue Summary 
              #{all_other_issue_summary}

              Individual Procedure Steps
              #{all_other_procedure_steps}

              Actual Time to Complete
              #{all_other_complete_time_hour} #{all_other_complete_time_min}

              Suggested Action
              #{all_other_suggested_action}"
    else 
      return "Error"

    end
  end

  def set_area_of_vehicle
    case inquiry_type
    when 'Missing Information'
      self.area_of_vehicle = missing_area_of_vehicle
    when 'Parts'
      self.area_of_vehicle = parts_area_of_vehicle
    when "Procedure Page Issue"
      self.area_of_vehicle = procedure_area_of_vehicle
    when 'Welded Panel Operations'
      self.area_of_vehicle = welded_area_of_vehicle
    when 'Non-Welded Panel Operations'
      self.area_of_vehicle = non_welded_area_of_vehicle
    when 'Refinish Operations'
      self.area_of_vehicle = refinished_area_of_vehicle
    when 'All Other'
      self.area_of_vehicle = "Other"
    else 
      return 
    end
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |inquiry|
        csv << inquiry.attributes.values_at(*column_names)
      end
    end
  end

  def cached_status_count_for(status)
    case status
    when 'Received by DEG'

    when 'Submitted to IP'
    when 'IP Response Received'
    when 'Resolved (IP Change)'
    when 'Resolved (No IP change)'
    end 
  end

  


  validates_attachment :attachment, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}

end
