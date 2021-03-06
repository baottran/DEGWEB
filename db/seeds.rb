# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'
require 'roo'



seed_vehicle_makes = [ ['Acura', 'Acura'],
                  ['Alfa Romeo', 'Alfa Romeo'],
                  ['Aston Martin', 'Aston Martin'],
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
                  ['Land Rover', 'Land Rover'],
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
                  ['Volvo', 'Volvo']]


seed_vehicle_years = [ 	['2016', '2016'],
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


seed_vehicle_bodytype  =	 [['Sedan', 'Sedan'],
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

seed_vehicle_database = ['Audatex','CCC','Mitchell']

seed_inquiry_options =  [	['Missing Information', 'Missing Information'],
                          ['Parts', 'Parts'],
                          ['Procedure Page Issue', 'Procedure Page Issue'],
                          ['Welded Panel Operations', 'Welded Panel Operations'],
                          ['Non-Welded Panel Operations', 'Non-Welded Panel Operations'],
                          ['Refinish Operations', 'Refinish Operations'],
                          ['All Other', 'All Other']]

seed_vehicles = [	['Toyota', 'Camry'],
									['Honda', 'Accord'],
									['Honda', 'Civic'],
									['Toyota', 'Corolla'],
									['Ford', 'Fusion'],
									['Nissan', 'Altima'],
									['Hyundai', 'Elantra'],
									['Nissan', 'Versa'],
									['Chevrolet', 'Malibu'],
									['Hyundai', 'Sonata'],
									['Subaru', 'Outback'],
									['Nissan', 'Sentra'],
									['Chevrolet', 'Cruze'],
									['Kia', 'Soul'],
									['Ford', 'Focus'],
									['Kia', 'Optima'],
									['Chrysler', '200'],
									['Toyota', 'Prius'],
									['Ford', 'Mustang'],
									['Chevrolet', 'Impala']]


def create_faker_inquiry
	seed_vehicle = seed_vehicles.sample
	inquiry_type = seed_inquiry_options.sample[0]

	@inquiry = Inquiry.new(	name: 			Faker::Name.name,
									title: 			Faker::Name.title,
									shop_name: 	Faker::Company.name,
									address_1: 	Faker::Address.street_address,
									address_2: 	Faker::Address.secondary_address,
									city:  			Faker::Address.city,
									zip_code:  	Faker::Address.zip,
									state:    	Faker::Address.state_abbr,
									phone: 		  Faker::PhoneNumber.phone_number,
									email: 			Faker::Internet.email,
									make:  			seed_vehicle[0],
									model: 			seed_vehicle[1],
									year: 			seed_vehicle_years.sample[0],
									body_type:  seed_vehicle_bodytype.sample[0],
									vin: 				Faker::Lorem.characters(17).capitalize,
									database: 	seed_vehicle_database.sample,
									inquiry_type: inquiry_type)
	if inquiry_type === 'Missing Information'
		@inquiry.missing_area_of_vehicle = 'Front'
		@inquiry.missing_part_name = Faker::Lorem.word
		@inquiry.missing_part_description = Faker::Lorem.paragraph
		@inquiry.missing_oem_part_number = Faker::Lorem.characters(10)
		@inquiry.missing_information = Faker::Lorem.paragraph
		@inquiry.missing_issue_summary = Faker::Lorem.paragraph
		@inquiry.missing_suggested_action = Faker::Lorem.paragraph
	elsif inquiry_type === 'Parts'
		@inquiry.parts_area_of_vehicle = 'Back'
		@inquiry.parts_part_name = Faker::Lorem.word
		@inquiry.parts_part_description = Faker::Lorem.sentence
		@inquiry.parts_oem_part_number = Faker::Lorem.characters(10)
		@inquiry.parts_issue_summary = Faker::Lorem.paragraph
		@inquiry.parts_suggested_action = Faker::Lorem.paragraph
	elsif inquiry_type === 'Procedure Page Issue'
		@inquiry.procedure_area_of_vehicle = 'Front'
		@inquiry.procedure_page_number = '2'
		@inquiry.procedure_issue_summary = Faker::Lorem.paragraph
		@inquiry.procedure_suggested_action = Faker::Lorem.paragraph
	elsif inquiry_type === 'Welded Panel Operations'
		@inquiry.welded_area_of_vehicle = 'Front'
		@inquiry.welded_part_name = Faker::Lorem.word
		@inquiry.welded_part_number = Faker::Lorem.characters(10)
		@inquiry.welded_issue_summary = Faker::Lorem.paragraph
		@inquiry.welded_weld_spots = '2'
		@inquiry.welded_materials_involved = 'metal'
		@inquiry.welded_procedure_steps = Faker::Lorem.paragraph
		@inquiry.welded_skill_level = 'Advanced'
		@inquiry.welded_complete_time_hour = '10'
		@inquiry.welded_complete_time_min = '15'
		@inquiry.welded_suggested_action = Faker::Lorem.paragraph
	elsif inquiry_type === 'Non-Welded Panel Operations'
		@inquiry.non_welded_area_of_vehicle = 'Back'
		@inquiry.non_welded_part_name = Faker::Lorem.word
		@inquiry.non_welded_part_number = Faker::Lorem.characters(10)
		@inquiry.non_welded_issue_summary = Faker::Lorem.paragraph
		@inquiry.non_welded_procedure_steps = Faker::Lorem.paragraph
		@inquiry.non_welded_skill_level = 'Intermediate'
		@inquiry.non_welded_complete_time_hour = '5'
		@inquiry.non_welded_complete_time_min = '30'
		@inquiry.non_welded_suggested_action = Faker::Lorem.paragraph
	elsif inquiry_type === 'Refinish Operations'
		@inquiry.refinished_area_of_vehicle = 'Other'
		@inquiry.refinished_issue_summary = Faker::Lorem.paragraph
		@inquiry.refinished_special_labor = Faker::Lorem.sentence
		@inquiry.refinished_surface_area = '80'
		@inquiry.refinished_suggested_action = Faker::Lorem.paragraph
	elsif inquiry_type === 'All Other'
		@inquiry.all_other_issue_summary = Faker::Lorem.paragraph
		@inquiry.all_other_procedure_steps = Faker::Lorem.paragraph
		@inquiry.all_other_complete_time_hour = '2'
		@inquiry.all_other_complete_time_min = '15'
		@inquiry.all_other_suggested_action = Faker::Lorem.paragraph
	end

	@inquiry.save
end

# 20.times do
# 	create_faker_inquiry
# end

puts "made it here"

def self.import(file)
  spreadsheet = open_spreadsheet(file)
  header = spreadsheet.row(1)
  (2..spreadsheet.last_row).each do |i|
    row = Hash[[header, spreadsheet.row(i)].transpose]
    product = find_by_id(row["id"]) || new
    product.attributes = row.to_hash.slice(*accessible_attributes)
    product.save!
  end
end

def self.open_spreadsheet(file)
  case File.extname(file.original_filename)
  when ".csv" then Csv.new(file.path, nil, :ignore)
  when ".xls" then Excel.new(file.path, nil, :ignore)
  when ".xlsx" then Excelx.new(file.path, nil, :ignore)
  else raise "Unknown file type: #{file.original_filename}"
  end
end

# lib/assets/DEG_EXPORT-20160513.xlsx

def read_excel
	spreadsheet = Roo::Excelx.new("./lib/assets/inquiries_20170127.xlsx")
	puts "read the spreasheet"
	header = spreadsheet.row(1)
	count = 0 
	database_categories = []
	other_1 = []
	other_2 = []

	counter = 0 

	spreadsheet.each(	id: 'DB_Index', 
						name: 'Name', 
						title: 'Title', 
						shop: 'Shop', 
						address: 'Address', 
						phone: 'Phone',
						fax: 'Fax',
						email: 'Email',
						year: 'Year',
						make: 'Make',
						model: 'Model',
						body_style: 'BodyStyle',
						body_style2: 'BodyStyle2',
						vin: 'VIN',
						db_category: 'DatabaseCategory',
						database: 'Database',
						product_serial: 'ProductSerial',
						notes: 'Notes',
						date_submitted: 'DateSubmitted',
						date_submit_ip: 'DateSubmitIP',
						db_inquiry_text: 'DatabaseInquiry',
						db_files: 'DatabaseFiles',
						admin_resolve_status: 'AdminResolveStatus',
						admin_description_short: 'AdminDescription',
						admin_description_full: 'AdminDescriptionFull',
						admin_resolve_description_full: 'AdminResolveDescripFull',
						admin_resolve_date: 'AdminResolveDate',
						admin_show_on_web: 'AdminShowOnWeb',
						admin_initial_time_ip: 'AdminInitialTimeIP',
						admin_resolve_descrip: 'AdminResolveDescrip',
						admin_resolve_time: 'AdminResolveDateDescrip') do |i|

		create_inquiry_from_spreadsheet_data(i)

		ActiveRecord::Base.connection.tables.each do |t|
			ActiveRecord::Base.connection.reset_pk_sequence!(t)
		end

	end

	
end

def create_error(i, msg, field, value, resolution)

	e = Error.new 

	if i[:id].present? 
		e.inquiry_num = i[:id]
	end

	if msg.present? 
		e.error_msg = msg
	end

	if field.present? 
		e.error_field = field
	end

	if value.present?
		p "value is #{value}"
		e.error_value = value 
	elsif msg != "success"
		e.error_value = "nil"
	end

	if resolution.present? 
		e.resolution = resolution 
	end

	e.save 
end


def create_inquiry_from_spreadsheet_data(i)

		# id = i[:id]

		# if id === 151 
		# 	p "invalid email"
		# 	return
		# end
		
		# if id === 151 || id === 220 || id === 221
		# 	p "invalid email!"
		# 	return
		# end

		# if i[:id] === 3648
		# 	return 
		# end

		if Inquiry.where(id: i[:id]).first != nil 
			p "!!! did not create inquiry with id #{i[:id]}"
			create_error(i, "duplicate id", "DB_ID",i[:id], "did not create")
			return 
		end

		inquiry 			= Inquiry.new 
		inquiry.id 			= i[:id]
		inquiry.name 		= i[:name]
		inquiry.title 		= i[:title]
		inquiry.shop_name 	= i[:shop]
		inquiry.address_1 	= i[:address]
		inquiry.phone 		= i[:phone]
		inquiry.email 		= i[:email]
		inquiry.fax 		= i[:fax]
		inquiry.year		= i[:year]
		inquiry.make		= i[:make] 
		inquiry.model		= i[:model] 
		inquiry.vin			= i[:vin] 
		inquiry.client_id	= i[:product_serial]

		# Inquiry Type 

		if i[:db_category] === "DatabaseCategory_Refinish"
			inquiry.inquiry_type = 'Refinish Operations'
		elsif i[:db_category] === "DatabaseCategory_MissingInfo"
			inquiry.inquiry_type = 'Missing Information'
		elsif i[:db_category] === "DatabaseCategory_WeldedPanel"
			inquiry.inquiry_type = 'Welded Panel Operations'
		elsif i[:db_category] === "DatabaseCategory_MissingParts"
			inquiry.inquiry_type = 'Parts'
		elsif i[:db_category] === "DatabaseCategory_ProcedurePage"
			inquiry.inquiry_type = 'Procedure Page Issue'
		elsif i[:db_category] === "DatabaseCategory_NonWeldedPart"
			inquiry.inquiry_type = 'Non-Welded Panel Operations'
		else 
			inquiry.inquiry_type = 'All Other'
		end

		# description setting 

		inquiry.short_desc = i[:admin_description_short]
		inquiry.old_description = i[:admin_description_full]		

		if i[:database] === "Audatex" || i[:database] === "Mitchell"
			inquiry.database = i[:database]
		elsif i[:database] === "CCC/Motor"
			inquiry.database = "CCC"
		else
			inquiry.database = "Mitchell"
			create_error(i, "missing database type of Audatex, Mitchell, or CCC", "Database", i[:database], "setting database to Mitchell")
		end 

		if i[:body_style2] === "Van"
			inquiry.body_type = "Van/Minivan"
		elsif i[:body_style2] === "SUV"
			inquiry.body_type = "SUV"
		elsif i[:body_style2] === "Coupe"
			inquiry.body_type = "Coupe"
		elsif i[:body_style2] === "Sedan"
			inquiry.body_type = "Sedan"
		elsif i[:body_style2] === "Wagon"
            inquiry.body_type = "Wagon"
		elsif i[:body_style2] === "Truck"
			inquiry.body_type = "Pickup"
		elsif i[:body_style2] === "Hatchback"
			inquiry.body_type = "Hatchback"
		elsif i[:body_style2] === "Convertible"
			inquiry.body_type = "Convertible"
		else
			inquiry.body_type = "Undefined"
		end

		if i[:admin_resolve_descrip] === "No Change"
			inquiry.status = "Resolved (No IP Change)"
		elsif i[:admin_resolve_descrip] === "DEG Response"
			inquiry.status = "Resolved (DEG Response)"
		elsif i[:admin_resolve_status] === "Recieved" || i[:admin_resolve_status] === "Received"
			inquiry.status = "Received by DEG"
		elsif i[:admin_resolve_status] === "No Change"
			inquiry.status = "Resolved (No IP Change)"
		elsif i[:admin_resolve_status] === "" || i[:admin_resolve_status] === "i" || i[:admin_resolve_status] === " " || i[:admin_resolve_status] === "AdminResolveStatus"
			inquiry.status = "Internal Resolution"
			create_error(i, "cannot determine status as Resolved (No IP Channge) or Resolved (IP Change)", "AdminResolveStatus", i[:admin_resolve_status], "setting status to Internal Resolution")
		elsif i[:admin_resolve_status] === "Submitted"
			inquiry.status = "Submitted to IP"
		else 
			inquiry.status = "Resolved (IP Change)"
		end
			 	
		if (i[:date_submitted].instance_of? Date) 
			inquiry.created_at = i[:date_submitted]
		else 
			create_error(i, "cannot determine date inquiry was submitted", "DateSubmitted", i[:date_submitted], "setting date submit date to today")
		end

		if (i[:date_submit_ip].instance_of? Date) 
			inquiry.submit_to_ip_date = i[:date_submit_ip]
		elsif inquiry.status != "Internal Resolution"
			inquiry.submit_to_ip_date = Date.today
			create_error(i, "cant find date submitted", "DateSubmitIP",i[:date_submit_ip], "setting date submitted to today")
		end

		if (i[:admin_resolve_date].instance_of? Date)
			inquiry.resolution_date = i[:admin_resolve_date]
		else 
			inquiry.resolution_date = Date.today
			create_error(i, "can't find date resolved", "AdminResolveDate",i[:admin_resolve_date], "setting date resolved to today")
		end



		inquiry.resolution 	= i[:admin_resolve_descrip] + "\n\n" + i[:admin_resolve_description_full] 
		inquiry.show_on_web = i[:admin_show_on_web] 	

		if i[:admin_resolve_time].present? 
			resolve_string = i[:admin_resolve_time]
			resolve_string_downcase = resolve_string.downcase 
			resolve_string_downcase.slice! "days"
			resolve_string_downcase.slice! "day"
			inquiry.completion_days = resolve_string_downcase.to_i 
		end	
 
		inquiry.transferred_from_old_db = true

		create_error(i, "success", "", "", "")

		# p "trying to create inquiry with id #{i[:id]}"

		if inquiry.save!
			p "successfully created i #{inquiry.id} original id #{i[:id]}"
		else 
			p "error #{i[:id]}"
		end

		# need to reload in order to set id
		inquiry.reload.id  

		# p "successfully loaded inquiry id #{inquiry.id} and #{i[:id]}"

		comment = Comment.new 
		comment.commenter = "Admin"
		comment.body = ""

		if i[:body_style].present?
			comment.body = comment.body + "Body Type: #{i[:body_style]}, "
		end

		if i[:notes].present? 
			comment.body = comment.body + "Notes: #{i[:notes]}, " 
		end

		if i[:admin_initial_time_ip].present?
			comment.body = comment.body + "Admin Initial Time IP: #{i[:admin_initial_time_ip]}" 
		end

		if i[:admin_resolve_time].present? 
			comment.body = comment.body + "Admin Resolve Time: #{i[:admin_resolve_time]}"
		end

		inquiry.comments.push(comment)

		comment.save 
end

def analyze_cell 
	spreadsheet = Roo::Excelx.new("./lib/assets/DEG_EXPORT-20160513.xlsx")
	p "read teh spreadsheet"
	p "#{spreadsheet.row(2)[26]}"
	p "#{spreadsheet.row(2)[25]}"

	i = Inquiry.find(3)

	text = spreadsheet.row(10)[25]
	i.old_description = text
	i.save
	p "====done===="

end

def setup_users
	User.create(name: "Bao Tran", email: "bowtran@gmail.com", password: "railstest", password_confirmation: "railstest", isadmin: false)
	User.create(name: "Bao Tran", email: "bao.tran@macys.com", password: "railstest", password_confirmation: "railstest", isadmin: true)
	# User.create(name: "Cameron Craig", email: "cameron.craig@sproutdesigns.com", password: "degweb", password_confirmation: "degweb", isadmin: true)
	# User.create(name: "Art", email: "admin@degweb.com", password: "degweb", password_confirmation: "degweb", isadmin: true)
	# User.create(name: "Jorge", email: "orgecgarciais@gmail.com", password: "degweb", password_confirmation: "degweb", isadmin: true)
end

def setup_reports
	r = Report.new
	r.save 
end

def setup_report_data

	# submitted to ip 
	p "in it"

	20.times do |i|
		p "creating new"
		i = Inquiry.new 
		i.database = ["CCC", "Audatex", "Mitchell"].sample 
		i.inquiry_type = ["All Other", "Refinish Operations", "Missing Information"].sample
		i.year = ["2009", "2014", "2015"].sample
		i.make = ["Mercedes-Benz", "Jeep", "Toyota", "Honda"].sample
		i.model = ["test1", "test2"].sample
		i.email = "test@test.com"
		i.phone = "4445553333"
		i.vin = "ABC"
		i.name = ["Example User 1", "Example User 2", "Example User 3"].sample


		i.submit_to_ip_date = Time.now - [3, 25, 55, 150].sample.days
		i.status = "Submitted to IP"
		i.created_at = i.submit_to_ip_date - [3, 25, 55, 150].sample.days

		if i.save 
			p "saved as #{i.id}"
		else 
			p "couldn't make it"
		end
	end

	 # resolved original

	10.times do |i|
		p "creating new"
		i = Inquiry.new 
		i.database = ["CCC", "Audatex", "Mitchell"].sample 
		i.inquiry_type = ["All Other", "Refinish Operations", "Missing Information"].sample
		i.year = ["2009", "2014", "2015"].sample
		i.make = ["Mercedes-Benz", "Jeep", "Toyota", "Honda"].sample
		i.model = ["test1", "test2"].sample
		i.email = "test@test.com"
		i.phone = "4445553333"
		i.vin = "ABC"
		i.name = ["Example User 1", "Example User 2", "Example User 3"].sample


		i.submit_to_ip_date = Time.now - [6, 25, 55, 150].sample.days
		i.created_at = i.submit_to_ip_date - [6, 25, 55, 150].sample.days
		i.resolution_date = i.submit_to_ip_date + [3, 5].sample.days

		i.status = "Resolved (IP Change)"


		if i.save 
			p "saved as #{i.id} but num is #{i[:id]}"
		else 
			p "couldn't make it"
		end
	end

	p "done"


	 # resolved repeat 

	 10.times do |i|
		p "creating new"
		i = Inquiry.new 
		i.database = ["CCC", "Audatex", "Mitchell"].sample 
		i.inquiry_type = ["All Other", "Refinish Operations", "Missing Information"].sample
		i.year = ["2009", "2014", "2015"].sample
		i.make = ["Mercedes-Benz", "Jeep", "Toyota", "Honda"].sample
		i.model = ["test1", "test2"].sample
		i.email = "test@test.com"
		i.phone = "4445553333"
		i.vin = "ABC"
		i.name = ["Example User 1", "Example User 2", "Example User 3"].sample


		i.submit_to_ip_date = Time.now - [6, 25, 55, 150].sample.days
		i.created_at = i.submit_to_ip_date - [6, 25, 55, 150].sample.days
		i.resolution_date = i.submit_to_ip_date + [3, 5].sample.days

		i.status = "Resolved (No IP Change)"


		if i.save 
			p "saved as #{i.id}"
		else 
			p "couldn't make it"
		end
	end

end

def setup_weekly_report_data

	# not submitted 

	10.times do |i|
		p "creating new"
		i = Inquiry.new 
		i.database = ["CCC", "Audatex", "Mitchell"].sample 
		i.inquiry_type = ["All Other", "Refinish Operations", "Missing Information"].sample
		i.year = ["2009", "2014", "2015"].sample
		i.make = ["Mercedes-Benz", "Jeep", "Toyota", "Honda"].sample
		i.model = ["test1", "test2"].sample
		i.email = "test@test.com"
		i.phone = "4445553333"
		i.vin = "ABC"
		i.name = ["Example User 1", "Example User 2", "Example User 3"].sample

		i.created_at = DateTime.now - [0, 1, 2, 3, 4, 5].sample.days

		i.status = "Received by DEG"

		if i.save 
			p "saved as #{i.id}"
		else 
			p "couldn't make it"
		end 
	end

	# submitted

	10.times do |i|
		p "creating new"
		i = Inquiry.new 
		i.database = ["CCC", "Audatex", "Mitchell"].sample 
		i.inquiry_type = ["All Other", "Refinish Operations", "Missing Information"].sample
		i.year = ["2009", "2014", "2015"].sample
		i.make = ["Mercedes-Benz", "Jeep", "Toyota", "Honda"].sample
		i.model = ["test1", "test2"].sample
		i.email = "test@test.com"
		i.phone = "4445553333"
		i.vin = "ABC"
		i.name = ["Example User 1", "Example User 2", "Example User 3"].sample

		i.submit_to_ip_date = DateTime.now - [0, 1, 2, 3, 4, 5].sample.days
		i.created_at = i.submit_to_ip_date - [0, 1, 2, 3, 4, 5].sample.days

		i.status = "Submitted to IP"


		if i.save 
			p "saved as #{i.id}"
		else 
			p "couldn't make it"
		end 
	end

	# resolved 

	10.times do |i|
		p "creating new"
		i = Inquiry.new 
		i.database = ["CCC", "Audatex", "Mitchell"].sample 
		i.inquiry_type = ["All Other", "Refinish Operations", "Missing Information"].sample
		i.year = ["2009", "2014", "2015"].sample
		i.make = ["Mercedes-Benz", "Jeep", "Toyota", "Honda"].sample
		i.model = ["test1", "test2"].sample
		i.email = "test@test.com"
		i.phone = "4445553333"
		i.vin = "ABC"
		i.name = ["Example User 1", "Example User 2", "Example User 3"].sample


		i.resolution_date = DateTime.now - [0, 1, 2, 3, 4, 5].sample.days
		i.submit_to_ip_date = i.resolution_date - [0, 1, 2, 3, 4, 5].sample.days
		i.created_at = i.submit_to_ip_date - [0, 1, 2, 3, 4, 5].sample.days

		i.status = "Submitted to IP"


		if i.save 
			p "saved as #{i.id}"
		else 
			p "couldn't make it"
		end 
	end
end






read_excel
setup_users
# setup_reports
# setup_report_data
# setup_weekly_report_data






p "done"
# analyze_cell



