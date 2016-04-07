module InquiriesHelper
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
    ['Other', 'Other']]
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




end
