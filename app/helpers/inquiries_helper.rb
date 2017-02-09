module InquiriesHelper

  def filter_date_types
    [['<select>', ' '],
    ['Origination Date', 'created_at'],
    ['Submission Date', ''],
    ['Resolution Date', '']]
  end

  def inquiry_statuses
    [['<select>', ' '],
    ['Received by DEG', 'Received by DEG'],
    ['Submitted to IP', 'Submitted to IP'],
    ['IP Response Received', 'IP Response Received'],
    ['Resolved (No IP Change)', 'Resolved (No IP Change)'],
    ['Resolved (IP Change)', 'Resolved (IP Change)'],
    ['Resolved (DEG Response)', 'Resolved (DEG Response)']]
  end


  def us_states
    [['<select>', ' '],
    ['Alaska', 'AK'],
    ['Arizona', 'AZ'],
    ['Arkansas', 'AR'],
    ['California', 'CA'],
    ['Colorado', 'CO'],
    ['Connecticut', 'CT'],
    ['Delaware', 'DE'],
    ['Florida', 'FL'],
    ['Georgia', 'GA'],
    ['Hawaii', 'HI'],
    ['Idaho', 'ID'],
    ['Illinois', 'IL'],
    ['Indiana', 'IN'],
    ['Iowa', 'IA'],
    ['Kansas', 'KS'],
    ['Kentucky', 'KY'],
    ['Louisiana', 'LA'],
    ['Maine', 'ME'],
    ['Maryland', 'MD'],
    ['Massachusetts', 'MA'],
    ['Michigan', 'MI'],
    ['Minnesota', 'MN'],
    ['Mississippi', 'MS'],
    ['Missouri','MO'],
    ['Montana', 'MT'],
    ['Nebraska', 'NE'],
    ['Nevada ', 'NV'],
    ['New Hampshire', 'NH'],
    ['New Jersey', 'NJ'],
    ['New Mexico', 'NM'],
    ['New York', 'NY'],
    ['North Carolina', 'NC'],
    ['North Dakota', 'ND'],
    ['Ohio', 'OH'],
    ['Oklahoma', 'OK'],
    ['Oregon', 'OR'],
    ['Pennsylvania', 'PA'],
    ['Rhode Island', 'RI'],
    ['South Carolina', 'SC'],
    ['South Dakota', 'SD'],
    ['Tennessee', 'TN'],
    ['Texas', 'TX'],
    ['Utah', 'UT'],
    ['Vermont', 'VT'],
    ['Virginia', 'VA'],
    ['Washington', 'WA'],
    ['West Virginia', 'WV'],
    ['Wisconsin', 'WI'],
    ['Wyoming', 'WY']]
  end

  def car_makes
    [['<select>', ' '],
    ['Acura', 'Acura'],
    ['Alfa Romeo', 'Alfa_Romeo'],
    ['Aston Martin', 'Aston_Martin'],
    ['Audi', 'Audi'],
    ['Bentley', 'Bentley'],
    ['BMW', 'BMW'],
    ['Buick', 'Buick'],
    ['Cadillac', 'Cadillac'],
    ['Chevrolet', 'Chevrolet'],
    ['Chrysler', 'Chrysler'],
    ['Dodge', 'Dodge'],
    ['Ferrari', 'Ferrari'],
    ['FIAT', 'FIAT'],
    ['Ford', 'Ford'],
    ['Freightliner', 'Freightliner'],
    ['GMC', 'GMC'],
    ['Honda', 'Honda'],
    ['Hyundai', 'Hyundai'],
    ['Infiniti', 'Infiniti'],
    ['Jaguar', 'Jaguar'],
    ['Jeep', 'Jeep'],
    ['Kia', 'Kia'],
    ['Lamborghini', 'Lamborghini'],
    ['Land Rover', 'Land_Rover'],
    ['Lexus', 'Lexus'],
    ['Lincoln', 'Lincoln'],
    ['Maserati', 'Maserati'],
    ['Mazda', 'Mazda'],
    ['McLaren', 'McLaren'],
    ['Mercedes-Benz', 'Mercedes-Benz'],
    ['MINI', 'MINI'],
    ['Mitsubishi', 'Mitsubishi'],
    ['Nissan', 'Nissan'],
    ['Porsche', 'Porsche'],
    ['Ram', 'Ram'],
    ['Rolls-Royce', 'Rolls-Royce'],
    ['Scion', 'Scion'],
    ['Smart', 'Smart'],
    ['Subaru', 'Subaru'],
    ['Tesla', 'Tesla'],
    ['Toyota', 'Toyota'],
    ['Volkswagen', 'Volkswagen'],
    ['Volvo', 'Volvo'],
    ['Other', 'Other']]
  end

  def car_years
    collection = [['<select>', ' ']]
    year = DateTime.now.year + 2

    while year > 1980 do 
        year_item = [year.to_s, year.to_s]
        collection = collection.push(year_item)
        year -= 1 
    end

    return collection
  end

  def car_body_types
    [['<select>', ' '],
    ['Sedan', 'Sedan'],
    ['Crossover', 'Crossover'],
    ['Pickup', 'Pickup'],
    ['SUV', 'SUV'],
    ['Coupe', 'Coupe'],
    ['Van/Minivan', 'Van/Minivan'],
    ['Convertible', 'Convertible'],
    ['Hatchback', 'Hatchback'],
    ['Wagon', 'Wagon']]
  end

  def database_types
    [['<select>', ' '],
    ['Audatex', 'Audatex'],
    ['CCC', 'CCC'],
    ['Mitchell', 'Mitchell']]
  end

  def inquiry_types
    [['<select the type that best applies>', ' '],
    ['Missing Information', 'Missing Information'],
    ['Parts', 'Parts'],
    ['Procedure Page Issue', 'Procedure Page Issue'],
    ['Welded Panel Operations', 'Welded Panel Operations'],
    ['Non-Welded Panel Operations', 'Non-Welded Panel Operations'],
    ['Refinish Operations', 'Refinish Operations'],
    ['All Other', 'All Other']]
  end

  def vehicle_areas
    [['<select>', ' '],
    ['Front', 'Front'],
    ['Back', 'Back'],
    ['Other', 'Other'],
    ["Front End Panel And Lamps", "Front End Panel And Lamps"],
    ["Front Bumper"                 , "Front Bumper"],
    ["Grille"                          , "Grille"],
    ["Front Body And Windshield",          "Front Body And Windshield"],
    ["Front Body Interior Sheetmetal"   , "Front Body Interior Sheetmetal"],
    ["Front Lamps"                      , "Front Lamps"],
    ["Radiator Support"                 , "Radiator Support"],
    ["Frame"                            , "Frame"],
    ["Cooling"                          , "Cooling"],
    ["Air Conditioner And Heater"       , "Air Conditioner And Heater"],
    ["Hood"                             , "Hood"],
    ["Fender"                           , "Fender"],
    ["Electrical"                       , "Electrical"],
    ["Engine / Transaxle"               , "Engine / Transaxle"],
    ["Engine Mounts"                    , "Engine Mounts"],
    ["Exhaust System"                   , "Exhaust System"],
    ["Emission System"                  , "Emission System"],
    ["Wheels"                           , "Wheels"],
    ["Front Suspension"                 , "Front Suspension"],
    ["Steering Gear And Linkage"        , "Steering Gear And Linkage"],
    ["Steering Column/Upper Steering And Components", "Steering Column/Upper Steering And Components"],
    ["Steering Wheel"                   ,"Steering Wheel"],
    ["Windshield"                       ,"Windshield"],
    ["Cab"                              ,"Cab"],
    ["Body Shell"                       ,"Body Shell"],
    ["Cowl"                             ,"Cowl"],
    ["Instrument Panel"                 ,"Instrument Panel"],
    ["Console"                          ,"Console"],
    ["Seats"                            ,"Seats"],
    ["Restraint Systems"                ,"Restraint Systems"],
    ["Seats And Tracks"                 ,"Seats And Tracks"],
    ["Roof"                             ,"Roof"],
    ["Pillars, Rocker And Floor"        ,"Pillars, Rocker And Floor"],
    ["Front Door"                       ,"Front Door"],
    ["Rear Door"                        ,"Rear Door"],
    ["Side Loading Door"                ,"Side Loading Door"],
    ["Back Glass"                       ,"Back Glass"],
    ["Pick Up Box"                      ,"Pick Up Box"],
    ["Quarter Panel"                    ,"Quarter Panel"],
    ["Fuel System"                      ,"Fuel System"],
    ["Rear Suspension"                  ,"Rear Suspension"],
    ["Spare Tire Carrier"               ,"Spare Tire Carrier"],
    ["Rear Body And Floor"              ,"Rear Body And Floor"],
    ["Trunk Lid"                        ,"Trunk Lid"],
    ["Lift Gate"                        ,"Lift Gate"],
    ["Rear Lamps"                       ,"Rear Lamps"],
    ["Rear Bumper"                      ,"Rear Bumper"],
    ["Recycled Assemblies"              ,"Recycled Assemblies"],
    ["Section Replacement & Refinish"   ,"Section Replacement & Refinish"]]
  end

  def procedure_page_numbers
    [['<select>', ' '],
    ['1', '1'],
    ['2', '2'],
    ['3', '3'],
    ['4', '4'],
    ['5', '5']]
  end

  def weld_spots
    [['<select>', ' '],
    ['1', '1'],
    ['2', '2'],
    ['3', '3'],
    ['4', '4'],
    ['5', '5']]
  end

  def weld_materials
    [['<select>', ' '],
    ['metal', 'metal'],
    ['plastic', 'plastic'],
    ['wood', 'wood'],
    ['cotton', 'cotton']]
  end

  def time_hours
    [['hours', ' '],
    ['0', '0'],
    ['1', '1'],
    ['2', '2'],
    ['3', '3'],
    ['4', '4'],
    ['5', '5'],
    ['6', '6'],
    ['7', '7'],
    ['8', '8'],
    ['9', '9'],
    ['10', '10'],
    ['11', '11'],
    ['12', '12'],
    ['13', '13']]
  end

  def time_minutes
    [['minutes', ' '],
    ['0', '0'],
    ['15', '15'],
    ['30', '30'],
    ['45', '45']]
  end

  def skill_levels
    [['<select>', ' '],
    ['Beginner', 'Beginner'],
    ['Average', 'Average'],
    ['Advanced', 'Advanced'],
    ['Expert', 'Expert']]
  end

  def surface_area_in
    [['<select>', ' '],
    ['5', '5'],
    ['10', '10'],
    ['15', '15'],
    ['20', '20'],
    ['25', '25'],
    ['30', '30'],
    ['35', '35'],
    ['40', '40'],
    ['45', '45'],
    ['50', '50'],
    ['55', '55'],
    ['60', '60'],
    ['65', '65'],
    ['70', '70'],
    ['75', '75'],
    ['80', '80'],
    ['85', '85'],
    ['90', '90'],
    ['95', '95'],
    ['100', '100']]
  end

  def resolution_time_for(inquiry)

    if inquiry.resolution_date!= nil 
        resolution_time = inquiry.resolution_date - inquiry.created_at
        return "#{resolution_time / 86400} days"
    end

    return nil 

  end

  def btn_class_for_status

    btn_class = "btn btn-default btn-status "

    if @chosen_status === params[:status] || ( params[:status] === nil && @chosen_status === 'All' )
        return btn_class + "selected"
    else
        return btn_class
    end

  end

  def btn_class_for_reporting

    btn_class = "btn btn-default "

    if @chosen_report === params[:type] || ( params[:type] === nil && @chosen_report === 'New Inquiries')
        return btn_class + "selected"
    else
        return btn_class
    end


  end

  def unsubmitted_inquiries(db = nil)
    inquiries = Inquiry.all
    inquiries = inquiries.where(status: 'Received by DEG')
    inquiries = inquiries.where(database: db) if db.present?
    return inquiries
  end

  def inquiries_for_timeframe(db = nil, timeframe = nil, end_date = nil)
    if timeframe.present? 
        if timeframe === "Week"
            start_date = (Time.now - 1.week).beginning_of_day 
        elsif timeframe === "Month"
            start_date = (Time.now - 1.month).beginning_of_day 
        elsif timeframe === "Quarter"
            start_date = (Time.now - 84.days).beginning_of_day 
        elsif timeframe === "Year"
            start_date = (Time.now - 1.year).beginning_of_day 
        end

        if end_date.present?
            inquiries = Inquiry.where(created_at: start_date..Date.parse(end_date).end_of_day)
        else
            inquiries = Inquiry.where(created_at: start_date..Date.today.end_of_day)
        end

        inquiries = inquiries.where(database: db)
    else

        if end_date.present?
            inquiries = Inquiry.where("created_at <= ?", Date.parse(end_date).end_of_day)
        else
            inquiries = Inquiry.where("created_at <= ?", Date.today.end_of_day)
        end

        inquiries = inquiries.where(database: db)
    end

    return inquiries.new_db
  end

  def percent_submitted(db = nil, timeframe = nil)

    inquiries_count = inquiries_for_timeframe(db, timeframe).count

    pct = num_submitted(db).to_f / inquiries_count
    return (pct * 100).round(0)
  end

  def num_submitted(db = nil, timeframe = nil, end_date = nil)
    return inquiries_for_timeframe(db, timeframe, end_date).count - num_unsubmitted(db, timeframe, end_date)
  end

  def num_unsubmitted(db = nil, timeframe = nil, end_date = nil)
    inquiries = inquiries_for_timeframe(db, timeframe, end_date).where(submit_to_ip_date: nil)
    inquiries = inquiries.where.not(status: 'Resolved (DEG Response)').where.not(status: 'Internal Resolution').new_db
    return inquiries.count
  end

  def total(db)
    return Inquiry.where(database: db).count
  end

  def num_original(db)
    return Inquiry.where(database: db).where(status: 'Resolved (IP Change)').count
  end

  def num_repeat(db)
    return Inquiry.where(database: db).where(status: 'Resolved (No IP Change)').count
  end


  def avg_response_time_for(db)
    responded_inquiries = Inquiry.where(database: db).where.not(submit_to_ip_date: nil)

    total_response_time = 0

    responded_inquiries.each do |inquiry|
        response_time = inquiry.submit_to_ip_date - inquiry.created_at
        total_response_time = total_response_time + response_time
    end

    if responded_inquiries.count != 0 
      avg_response_time = total_response_time / responded_inquiries.count
    else  
      avg_response_time = 0
    end

    return avg_response_time
  end

  def avg_completion_time_for(db)
    completed_inquiries = Inquiry.where(database: db).where.not(resolution_date: nil)

    total_completion_time = 0 

    completed_inquiries.each do |inquiry|
      completion_time = inquiry.resolution_date - inquiry.created_at
      total_completion_time = completion_time + total_completion_time
    end

    if completed_inquiries.count != 0 
      avg_completion_time = total_completion_time / completed_inquiries.count
    else
      avg_completion_time = 0
    end

    return avg_completion_time
  end


  def time_to_days(time)
    return (time / 86400).round(2)
  end

  def calculate_aging

    incomplete_inquiries = Inquiry.where(resolution_date: nil)
    
    audatex = inquiry_age_array(incomplete_inquiries.audatex)
    ccc = inquiry_age_array(incomplete_inquiries.ccc)
    mitchell = inquiry_age_array(incomplete_inquiries.mitchell)

    return [
            ["< 2 weeks", audatex["< 2 weeks"],ccc["< 2 weeks"],mitchell["< 2 weeks"]],
            ["2-4 weeks", audatex["2-4 weeks"],ccc["2-4 weeks"],mitchell["2-4 weeks"]],
            ["4+ weeks", audatex["4+ weeks"],ccc["4+ weeks"],mitchell["4+ weeks"]]
        ]
  end

  def inquiry_age_array(inquiries)

    age_set = {"< 2 weeks" => 0, "2-4 weeks" => 0, "4+ weeks" => 0}

    two_weeks_in_secs = 1209600
    four_weeks_in_secs = 2419200

    inquiries.each do |inquiry|
      current_age = Time.now - inquiry.created_at 

      if current_age <= two_weeks_in_secs
        age_set["< 2 weeks"] = age_set["< 2 weeks"] + 1
      elsif current_age > two_weeks_in_secs && current_age <= four_weeks_in_secs
        age_set["2-4 weeks"] = age_set["2-4 weeks"] + 1
      else
        age_set["4+ weeks"] = age_set["4+ weeks"] + 1
      end
    end

    return age_set
  end

  def calculate_time_unresolved(inquiry)
    current_time = Date.today
    create_date = Date.parse(inquiry.created_at.beginning_of_day.to_s)
    time_unresolved = create_date.business_dates_until(current_time).count 
    return time_unresolved
  end


  def new_inquiries_all(chosen_end_date = nil)
    start_date = Inquiry.new_db.order('created_at ASC').first.created_at

    if chosen_end_date.present? 
        current_date = Date.parse(chosen_end_date).end_of_day
    else 
        current_date = Time.now 
    end

    num_months_between = (current_date.year * 12 + current_date.month) - (start_date.year * 12 + start_date.month)

    # prepare columns

    x_data = Array.new
    audatex_dict = Hash.new 
    ccc_dict = Hash.new 
    mitchell_dict = Hash.new 

    for i in 0..num_months_between
        day_value = start_date + i.month
        day_string = day_value.strftime('%Y-%m')
        x_data.append(day_string)
        audatex_dict[day_string] = 0
        ccc_dict[day_string] = 0
        mitchell_dict[day_string] = 0
    end

    # put data into group 

    if chosen_end_date.present?
        reporting_inquiries = Inquiry.where("created_at <= ?", Date.parse(chosen_end_date).end_of_day).new_db
    else 
        reporting_inquiries = Inquiry.new_db
    end
    

    reporting_inquiries.each do |inquiry|
        created_at_date = inquiry.created_at.beginning_of_day
        created_at_string = created_at_date.strftime('%Y-%m')
        case inquiry.database
        when "CCC"
            ccc_dict[created_at_string] += 1
        when "Mitchell"
            mitchell_dict[created_at_string] += 1
        when "Audatex"
            audatex_dict[created_at_string] += 1
        else
            puts "sorting error"
        end
    end

    audatex_data = Array.new 
    ccc_data = Array.new 
    mitchell_data = Array.new 

    x_data.each_with_index do |date, index|
        x_data[index] = x_data[index] + "-01"
        audatex_data.append(audatex_dict[date])
        ccc_data.append(ccc_dict[date])
        mitchell_data.append(mitchell_dict[date])
    end

    x_data.unshift("x")
    audatex_data.unshift("Audatex")
    ccc_data.unshift("CCC")
    mitchell_data.unshift("Mitchell")

    return [x_data, audatex_data, ccc_data, mitchell_data] 
  end

  def new_inquiries_week(chosen_end_date = nil)

    if chosen_end_date.present?
        end_date = Date.parse(chosen_end_date).end_of_day
    else
        end_date = Time.now 
    end

    start_date = (end_date - 1.week).beginning_of_day

    # prepare columns

    x_data = Array.new
    audatex_dict = Hash.new 
    ccc_dict = Hash.new 
    mitchell_dict = Hash.new 

    for i in 0..7 
        day_value = start_date + i.days
        day_string = day_value.strftime('%Y-%m-%d')
        x_data.append(day_string)
        audatex_dict[day_string] = 0
        ccc_dict[day_string] = 0
        mitchell_dict[day_string] = 0
    end

    # put data into group 

    week_inquiries = Inquiry.where(created_at: start_date..end_date).new_db

    week_inquiries.each do |inquiry|
        created_at_date = inquiry.created_at.beginning_of_day
        created_at_string = created_at_date.strftime('%Y-%m-%d')
        case inquiry.database
        when "CCC"
            ccc_dict[created_at_string] += 1
        when "Mitchell"
            mitchell_dict[created_at_string] += 1
        when "Audatex"
            audatex_dict[created_at_string] += 1
        else
            puts "sorting error"
        end
    end

    audatex_data = Array.new 
    ccc_data = Array.new 
    mitchell_data = Array.new 

    x_data.each_with_index do |date, index|
        audatex_data.append(audatex_dict[date])
        ccc_data.append(ccc_dict[date])
        mitchell_data.append(mitchell_dict[date])
    end

    x_data.unshift("x")
    audatex_data.unshift("Audatex")
    ccc_data.unshift("CCC")
    mitchell_data.unshift("Mitchell")

    return [x_data, audatex_data, ccc_data, mitchell_data]   
  end

  ###################################

  def new_inquiries_month(chosen_end_date = nil)

    if chosen_end_date.present? 
        end_date = Date.parse(chosen_end_date).end_of_day
    else
        end_date = Time.now
    end


    start_date = (end_date - 1.month).beginning_of_day 

    # prepare columns

    x_data = Array.new
    audatex_dict = Hash.new 
    ccc_dict = Hash.new 
    mitchell_dict = Hash.new 


    for i in 0..31
        day_value = start_date + i.days
        day_string = day_value.strftime('%Y-%m-%d')
        x_data.append(day_string)
        audatex_dict[day_string] = 0
        ccc_dict[day_string] = 0
        mitchell_dict[day_string] = 0
    end

    # put data into group 

    week_inquiries = Inquiry.where(created_at: start_date..end_date).new_db

    week_inquiries.each do |inquiry|
        created_at_date = inquiry.created_at.beginning_of_day
        created_at_string = created_at_date.strftime('%Y-%m-%d')
        p "\n =============="
        p created_at_string
        p ccc_dict

        case inquiry.database
        when "CCC"
            ccc_dict[created_at_string] += 1
        when "Mitchell"
            mitchell_dict[created_at_string] += 1
        when "Audatex"
            audatex_dict[created_at_string] += 1
        else
            puts "sorting error"
        end
    end

    audatex_data = Array.new 
    ccc_data = Array.new 
    mitchell_data = Array.new 

    x_data.each_with_index do |date, index|
        audatex_data.append(audatex_dict[date])
        ccc_data.append(ccc_dict[date])
        mitchell_data.append(mitchell_dict[date])
    end

    x_data.unshift("x")
    audatex_data.unshift("Audatex")
    ccc_data.unshift("CCC")
    mitchell_data.unshift("Mitchell")

    return [x_data, audatex_data, ccc_data, mitchell_data] 

  end

  #################################

  def new_inquiries_quarter(chosen_end_date = nil)

    if chosen_end_date.present? 
        end_date = Date.parse(chosen_end_date)
    else
        end_date = Time.now
    end

    start_date = (end_date - 84.days).beginning_of_day 

    # prepare columns
    x_days = Array.new 
    x_data = Array.new
    audatex_dict = Hash.new 
    ccc_dict = Hash.new 
    mitchell_dict = Hash.new 

    for i in 0..12
        day_value = start_date + (i*7).days
        day_string = day_value.strftime('%Y-%m-%d')
        x_days.append(day_value)
        x_data.append(day_string)
        audatex_dict[day_string] = 0
        ccc_dict[day_string] = 0
        mitchell_dict[day_string] = 0
    end

    # put data into group 

    quarter_inquiries = Inquiry.where(created_at: start_date..end_date).new_db

    quarter_inquiries.each do |inquiry|
        created_at_date = inquiry.created_at.beginning_of_day

        x_days.each do |week_start_date|
            if (created_at_date >= week_start_date) && (created_at_date <= (week_start_date + 7.days))
                created_at_string = week_start_date.strftime('%Y-%m-%d')
                case inquiry.database
                when "CCC"
                    ccc_dict[created_at_string] += 1
                when "Mitchell"
                    mitchell_dict[created_at_string] += 1
                when "Audatex"
                    audatex_dict[created_at_string] += 1
                else
                    puts "DB ERROR: inquiry #{inquiry.id} missing database value"
                end
            end
        end
    end

    audatex_data = Array.new 
    ccc_data = Array.new 
    mitchell_data = Array.new 

    x_data.each_with_index do |date, index|
        audatex_data.append(audatex_dict[date])
        ccc_data.append(ccc_dict[date])
        mitchell_data.append(mitchell_dict[date])
    end

    x_data.unshift("x")
    audatex_data.unshift("Audatex")
    ccc_data.unshift("CCC")
    mitchell_data.unshift("Mitchell")

    return [x_data, audatex_data, ccc_data, mitchell_data] 

  end

  ###################################

    def new_inquiries_year(chosen_end_date = nil)

        if chosen_end_date.present?
            end_date = Date.parse(chosen_end_date).end_of_day
        else
            end_date = Time.now
        end

        start_date = (end_date - 1.year).beginning_of_day 
    
        # prepare columns
    
        x_data = Array.new
        audatex_dict = Hash.new 
        ccc_dict = Hash.new 
        mitchell_dict = Hash.new 
    
        for i in 0..12
            day_value = start_date + i.month
            day_string = day_value.strftime('%Y-%m')
            x_data.append(day_string)
            audatex_dict[day_string] = 0
            ccc_dict[day_string] = 0
            mitchell_dict[day_string] = 0
        end
    
        # put data into group 
    
        year_inquiries = Inquiry.where(created_at: start_date..end_date).new_db
    
        year_inquiries.each do |inquiry|
            created_at_date = inquiry.created_at.beginning_of_day
            created_at_string = created_at_date.strftime('%Y-%m')
            case inquiry.database
            when "CCC"
                ccc_dict[created_at_string] += 1
            when "Mitchell"
                mitchell_dict[created_at_string] += 1
            when "Audatex"
                audatex_dict[created_at_string] += 1
            else
                puts "sorting error"
            end
        end
    
        audatex_data = Array.new 
        ccc_data = Array.new 
        mitchell_data = Array.new 
    
        x_data.each_with_index do |date, index|
            x_data[index] = x_data[index] + "-01"
            audatex_data.append(audatex_dict[date])
            ccc_data.append(ccc_dict[date])
            mitchell_data.append(mitchell_dict[date])
        end
    
        x_data.unshift("x")
        audatex_data.unshift("Audatex")
        ccc_data.unshift("CCC")
        mitchell_data.unshift("Mitchell")
    
        return [x_data, audatex_data, ccc_data, mitchell_data] 
    end

    def cache_key_for_products
        count          = Inquiry.count
        max_updated_at = Inquiry.maximum(:updated_at).try(:utc).try(:to_s, :number)
        "products/all-#{count}-#{max_updated_at}"
    end

    def cache_key_for_inquiry_update
        max_updated_at = Inquiry.maximum(:updated_at).try(:utc).try(:to_s, :number)
        "Inquiry/last_update-#{max_updated_at}"
    end

    def cache_key_for_dataset(fordate = nil)
        if fordate === nil 
            return Time.now.strftime("%Y%m%d%H")
        else
            return fordate
        end
    end
end
