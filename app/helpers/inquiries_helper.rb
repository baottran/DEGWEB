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
    ['Resolved (IP Change)', 'Resolved (IP Change)']]
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
    [['<select>', ' '],
    ['2016', '2016'],
    ['2015', '2015'],
    ['2014', '2014'],
    ['2013', '2013'],
    ['2012', '2012'],
    ['2011', '2011'],
    ['2010', '2010'],
    ['2009', '2009'],
    ['2008', '2008'],
    ['2007', '2007'],
    ['2006', '2006'],
    ['2005', '2005'],
    ['2004', '2004'],
    ['2003', '2003'],
    ['2002', '2002'],
    ['2001', '2001'],
    ['2000', '2000'],
    ['1999', '1999'],
    ['1998', '1998'],
    ['1997', '1997'],
    ['1996', '1996'],
    ['1995', '1995'],
    ['1994', '1994'],
    ['1993', '1993'],
    ['1992', '1992'],
    ['1991', '1991'],
    ['1990', '1990'],
    ['1989', '1989'],
    ['1988', '1988'],
    ['1987', '1987'],
    ['1986', '1986']]
  end

  def car_body_types
    [['<select>', ' '],
    ['Sedan', 'Sedan'],
    ['Crossover', 'Crossover'],
    ['Pickup', 'Pickup'],
    ['SUV', 'SUV'],
    ['Coupe', 'Coupe'],
    ['Luxury', 'Luxury'],
    ['Hybrid', 'Hybrid'],
    ['Van/Minivan', 'Van/Minivan'],
    ['Convertible', 'Convertible'],
    ['Hatchback', 'Hatchback'],
    ['Wagon', 'Wagon'],
    ['Electric', 'Electric']]
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
    ['Intermediate', 'Intermediate'],
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
    # inquiries = inquiries.where("submit_to_ip_date is NULL OR submit_to_ip_date = 'F'")
    # inquiries = inquiries.where("resolution_date is NULL or resolution_date = 'F'")
    # inquiries = inquiries.where("submit_to_ip_date IS NULL OR submit_to_ip_date = ?", false)
    # inquiries = inquiries.where("resolution_date IS NULL OR resolution_date = ?", false)
    inquiries = inquiries.where(status: 'Received by DEG')
    inquiries = inquiries.where(database: db) if db.present?
    return inquiries
  end

  def percent_submitted(db = nil)
    all_inquiries = Inquiry.where(database: db).count
    pct = num_submitted(db).to_f / all_inquiries
    return (pct * 100).round(2)
  end

  def num_submitted(db = nil)
    return Inquiry.where(database: db).count - num_unsubmitted(db)
  end

  def num_unsubmitted(db = nil)
    return Inquiry.where(database: db).where(submit_to_ip_date: nil).count
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
    elsif  
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
        puts "inquiry is two weeks old"
      elsif current_age > two_weeks_in_secs && current_age <= four_weeks_in_secs
        age_set["2-4 weeks"] = age_set["2-4 weeks"] + 1
      else
        age_set["4+ weeks"] = age_set["4+ weeks"] + 1
      end
    end

    return age_set
  end

  def calculate_time_unresolved(inquiry)
    time_unresolved = Time.now - inquiry.created_at
    return time_unresolved
  end

  def new_inquiries_test
    new_inquiries_week
  end


  def new_inquiries_all
    return new_inquiries_week
  end

  def new_inquiries_week

    start_date = (Time.now - 1.week).beginning_of_day 

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

    week_inquiries = Inquiry.where(created_at: start_date..Date.today)

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

  def new_inquiries_month

    start_date = (Time.now - 1.month).beginning_of_day 

    # prepare columns

    x_data = Array.new
    audatex_dict = Hash.new 
    ccc_dict = Hash.new 
    mitchell_dict = Hash.new 

    for i in 0..30
        day_value = start_date + i.days
        day_string = day_value.strftime('%Y-%m-%d')
        x_data.append(day_string)
        audatex_dict[day_string] = 0
        ccc_dict[day_string] = 0
        mitchell_dict[day_string] = 0
    end

    # put data into group 

    week_inquiries = Inquiry.where(created_at: start_date..Date.today)

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

  #################################

  def new_inquiries_quarter
    start_date = (Time.now - 3.month).beginning_of_day 

    x_data = ['x']
    audatex_data = ['Audatex']
    ccc_data = ['CCC']
    mitchell_data = ['Mitchell']

    for i in 0..90
        day_value = start_date + i.days
        day_string = day_value.strftime('%Y-%m-%d')
        x_data.append(day_string)
        audatex_data.append(rand(10))
        ccc_data.append(rand(10))
        mitchell_data.append(rand(10))
    end

    result = [x_data, audatex_data, ccc_data, mitchell_data]

    return result 
    puts "result is #{result}"

  end

    def new_inquiries_year

        start_date = (Time.now - 1.year).beginning_of_day 
    
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

        puts "year day_string is #{x_data}"
    
        # put data into group 
    
        week_inquiries = Inquiry.where(created_at: start_date..Date.today)
    
        week_inquiries.each do |inquiry|
            created_at_date = inquiry.created_at.beginning_of_day
            created_at_string = created_at_date.strftime('%Y-%m')
            case inquiry.database
            when "CCC"
                puts "error here"
                puts "ccc_dict is #{ccc_dict}"
                puts "created_at_string is #{created_at_string}"
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

end
