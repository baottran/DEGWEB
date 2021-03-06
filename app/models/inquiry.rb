class Inquiry < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  # validates :name, presence: true
  # validates :phone, presence: true

  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # # validates :email, presence: true,
  # #                   length: { maximum: 255 }
  # #                   # format: { with: VALID_EMAIL_REGEX }

  # validates :make, presence: true
  # validates :model, presence: true
  # validates :year, presence: true
  # validates :database, presence: true
  # validates :inquiry_type, presence: true
  
  # errors with s3_region when trying to run on local server 
  # :s3_region: ENV["aws_region"],
  # :s3_protocol => 'https',

  has_attached_file :attachment,
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials },
                    :path => "/inquiries/:id/:basename.:extension", 
                    :url => ":s3_domain_url"

  has_attached_file :attachment2,
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials },
                    :path => "/inquiries/:id/:basename.:extension", 
                    :url => ":s3_domain_url"

  has_attached_file :attachment3,
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials },
                    :path => "/inquiries/:id/:basename.:extension", 
                    :url => ":s3_domain_url"

  has_attached_file :attachment4,
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials },
                    :path => "/inquiries/:id/:basename.:extension", 
                    :url => ":s3_domain_url"

  has_attached_file :attachment5,
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials },
                    :path => "/inquiries/:id/:basename.:extension", 
                    :url => ":s3_domain_url"               

  after_initialize :init, :set_criteria, :set_area_of_vehicle, :set_admin_search_criteria

  before_save :capitalize_vin, :set_criteria, :set_area_of_vehicle, :set_admin_search_criteria

  # after_save :set_criteria, :set_area_of_vehicle, :capitalize_vin

  scope :ccc, -> { where(database: "CCC") }
  scope :mitchell, -> { where(database: "Mitchell") }
  scope :audatex, -> { where(database: "Audatex") }
  scope :new_db, -> { where(transferred_from_old_db: nil) }
  scope :not_internal, -> { where.not(status: 'Internal Resolution') }
  scope :open, -> { where(resolution_date: nil) }
  scope :closed, -> { where.not(resolution_date: nil) }

  scoped_search on: [:search_criteria]

  def init
    self.status  ||= "Received by DEG"
    self.show_on_web  ||= false           #will set the default value only if it's nil
  end

  def capitalize_vin 
    self.vin = vin.upcase
  end

  def set_criteria

    search_data = "#{year} #{make} #{model} #{inquiry_type} #{id}"

    if old_description.present?
      search_data += "#{old_description} "
    end

    if inquiry_type === 'Missing Information'

      search_data = search_data + "#{missing_oem_part_number} #{missing_information} #{missing_part_name} #{missing_part_description} #{missing_issue_summary} #{missing_area_of_vehicle} #{missing_area_of_vehicle_other_field}"

    elsif inquiry_type === 'Parts'

      search_data = search_data + "#{parts_area_of_vehicle} #{parts_area_of_vehicle_other_field} #{parts_part_name} #{parts_part_description} #{parts_oem_part_number} #{parts_issue_summary} #{parts_suggested_action}"

    elsif inquiry_type === "Procedure Page Issue"
      
      search_data = search_data + "#{procedure_area_of_vehicle} #{procedure_area_of_vehicle_other_field} #{procedure_issue_summary} #{procedure_suggested_action}"

    elsif inquiry_type === 'Welded Panel Operations'

      search_data = search_data + "#{welded_area_of_vehicle} #{welded_area_of_vehicle_other_field} #{welded_part_name} #{welded_part_number} #{welded_issue_summary} #{welded_weld_spots} #{welded_materials_involved} #{welded_procedure_steps} #{welded_skill_level} #{welded_suggested_action}"

    elsif inquiry_type === 'Non-Welded Panel Operations'

      search_data = search_data + "#{non_welded_area_of_vehicle} #{non_welded_area_of_vehicle_other_field} #{non_welded_part_name} #{non_welded_issue_summary} #{non_welded_procedure_steps} #{non_welded_skill_level} #{non_welded_suggested_action}"

    elsif inquiry_type === 'Refinish Operations'

      search_data = search_data + "#{refinished_area_of_vehicle} #{refinished_area_of_vehicle_other_field} #{refinished_issue_summary} #{refinished_special_labor} #{refinished_surface_area} #{refinished_suggested_action}"

    elsif inquiry_type === 'All Other'

      search_data = search_data + "#{all_other_issue_summary} #{all_other_procedure_steps} #{all_other_suggested_action}"

    end

    if resolution != nil 
      search_data = search_data + "#{resolution}"
    end
          
    self.search_criteria = search_data.downcase
  end

  def set_admin_search_criteria 
    search_data = self.search_criteria

    search_data = search_data + "#{name} #{title} #{shop_name} #{address_1} #{address_2} #{city} #{zip_code} #{phone} #{fax} #{email}"

    self.admin_search_criteria = search_data.downcase

  end

  def self.search(search)
    inquiries = Inquiry.all 

    if search 
      return inquiries.search_for(search)
    else
      return inquiries
    end
    
  end

  def self.admin_search(search)
    inquiries = Inquiry.all 

    if search 
      return inquiries.search_for(search)
    else
      return inquiries
    end
  end

  def s3_credentials
    {:bucket => ENV["aws_bucket"], :access_key_id => ENV["aws_access_key_id"], :secret_access_key => ENV["aws_secret_access_key"]}
  end

  def time_to_resolve
    if resolution_date === nil 
      return nil 
    end

    if completion_days != nil 
      return completion_days
    end 

    create_date = Date.parse(created_at.beginning_of_day.to_s)
    complete_date = Date.parse(resolution_date.beginning_of_day.to_s)
    res_days = create_date.business_dates_until(complete_date)

    p "#{id} :: saving "
    self.completion_days =  res_days.count
    save

    # p "\n==========="
    # p create_date
    # p complete_date
    # p "days: #{res_days.count}"
    # p "#{res_days}"


    return res_days.count 
  end


  def time_to_resolve_days
    if self.time_to_resolve === nil 
      return nil 
    end

    return "#{self.time_to_resolve} days"
  end


  def description_tooltip

    if self.transferred_from_old_db === true 
      return self.old_description
    end

    case inquiry_type

    when 'Missing Information'
      return "Area of Vehicle
              #{missing_area_of_vehicle}
              
              Missing Part Name
              #{missing_part_name}
              
              Missing Part Description
              #{missing_part_description}

              Issue Summary
              #{missing_issue_summary}

              Suggested Action
              #{missing_suggested_action}"
    when 'Parts'
      return "Area of Vehicle\n
              #{parts_area_of_vehicle}\n
              \n
              Part Name\n
              #{parts_part_name}\n
              \n
              OEM Part Number\n
              #{parts_oem_part_number}\n
              \n
              Issue Summary \n
              #{parts_issue_summary}\n
              \n
              Suggested Action \n
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

  def self.database(db)
    where(database: db)
  end

  def self.start_date_for(period)
    end_date = Time.now
    if period == "week"
      return (end_date - 1.week).beginning_of_day
    elsif period == "month"
      return (end_date - 1.month).beginning_of_day
    elsif period == "quarter"
      return (end_date - 3.months).beginning_of_day
    elsif period == "year"
      return (end_date - 1.year).beginning_of_day
    end
  end

  def self.resolved_in_last(period)
    end_date = Time.now
    start_date = start_date_for(period)

    return where(resolution_date: start_date..end_date)
  end

  def self.unresolved_in_last(period)
    end_date = Time.now
    start_date = start_date_for(period)

    return where(resolution_date: nil). where(created_at: start_date..end_date)
  end

        



  


  validates_attachment :attachment, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}

end
