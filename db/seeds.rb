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
	spreadsheet = Roo::Excelx.new("./lib/assets/DEG_EXPORT-20160513.xlsx")
	puts "read the spreasheet"
	header = spreadsheet.row(1)
	count = 0 
	database_categories = []
	other_1 = []
	other_2 = []
	spreadsheet.each(	id: 'RFRID', 
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
						admin_resolve_time: 'AdminResolveDateDescrip') do |i|

		create_inquiry_from_spreadsheet_data(i)

	end



end



def create_inquiry_from_spreadsheet_data(i)

		inquiry 			= Inquiry.new 
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

		if i[:db_category] === "DatabaseCategory_Refinish"
			inquiry.inquiry_type = 'Refinish Operations'
			inquiry.refinished_area_of_vehicle = i[:admin_description_short]
			# inquiry.refinished_issue_summary = i[:db_inquiry_text]
			# inquiry.refinished_suggested_action = i[:admin_description_full]

		elsif i[:db_category] === "DatabaseCategory_MissingInfo"
			inquiry.inquiry_type = 'Missing Information'
			inquiry.missing_area_of_vehicle = i[:admin_description_short]
			# inquiry.missing_issue_summary = i[:db_inquiry_text]
			# inquiry.missing_suggested_action = i[:admin_description_full]

		elsif i[:db_category] === "DatabaseCategory_WeldedPanel"
			inquiry.inquiry_type = 'Welded Panel Operations'
			inquiry.welded_area_of_vehicle = i[:admin_description_short]
			# inquiry.welded_issue_summary = i[:db_inquiry_text]
			# inquiry.welded_suggested_action = i[:admin_description_full]

		elsif i[:db_category] === "DatabaseCategory_MissingParts"
			inquiry.inquiry_type = 'Parts'
			inquiry.parts_area_of_vehicle = i[:admin_description_short]
			# inquiry.parts_issue_summary = i[:db_inquiry_text]
			# inquiry.parts_suggested_action = i[:admin_description_full]

		elsif i[:db_category] === "DatabaseCategory_ProcedurePage"
			inquiry.inquiry_type = 'Procedure Page Issue'
			inquiry.procedure_area_of_vehicle = i[:admin_description_short]
			# inquiry.procedure_issue_summary = i[:db_inquiry_text]
			# inquiry.procedure_suggested_action = i[:admin_description_full]

		elsif i[:db_category] === "DatabaseCategory_NonWeldedPart"
			inquiry.inquiry_type = 'Non-Welded Panel Operations'
			inquiry.non_welded_area_of_vehicle = i[:admin_description_short]
			# inquiry.non_welded_issue_summary = i[:db_inquiry_text]
			# inquiry.non_welded_suggested_action = i[:admin_description_full]

		else 
			inquiry.inquiry_type = 'All Other'
			inquiry.all_other_suggested_action = i[:admin_description_short] + i[:admin_description_full]
			# inquiry.all_other_issue_summary = i[:db_inquiry_text]
		end


		if i[:database] === "Audatex" || i[:database] === "Mitchell"
			inquiry.database = i[:database]
		elsif i[:database] === "CCC/Motor"
			inquiry.database = "CCC"
		else
			inquiry.database = "Undefined"
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

		if i[:admin_resolve_status] === "Recieved" || i[:admin_resolve_status] === "Received"
			inquiry.status = "Received by DEG"
		elsif i[:admin_resolve_status] === "No Change"
			inquiry.status = "Resolved (No IP Change)"
		elsif i[:admin_resolve_status] === "" || i[:admin_resolve_status] === "i" || i[:admin_resolve_status] === " " || i[:admin_resolve_status] === "AdminResolveStatus"
			inquiry.status = "Undefined"
		elsif i[:admin_resolve_status] === "Submitted"
			inquiry.status = "Submitted to IP"
		else 
			inquiry.status = "Resolved (IP Change)"
		end
			 	
		if (i[:date_submitted].instance_of? Date) 
			inquiry.created_at = i[:date_submitted]
		else 
			# p "couldn't set date for #{i[:id]}"
		end

		if (i[:date_submit_ip].instance_of? Date) 
			inquiry.submit_to_ip_date = i[:date_submit_ip]
		else 
			# p "couldn't set date for #{i[:id]}"
		end

		if (i[:admin_resolve_date].instance_of? Date)
			inquiry.resolution_date = i[:admin_resolve_date]
		else 
			# p "couldn't set resolution date for #{i[:id]}"
		end

		inquiry.resolution 	= i[:admin_resolve_description_full] 
		inquiry.show_on_web = i[:admin_show_on_web] 		
		inquiry.old_description = i[:admin_description_full]		

		inquiry.save 

		comment = Comment.new 
		comment.commenter = "Admin"

		if i[:body_style].present? 
			comment.body += "Body Type: #{i[:body_style]}, "
		end

		if i[:product_serial].present? 
			comment.body += "Body Type: #{i[:body_style]}, "
		end

		if i[:notes].present? 
			comment.body += "Notes: #{i[:notes]}, " 
		end

		if i[:admin_initial_time_ip].present?
			comment.body += "Admin Initial Time IP: #{i[:admin_initial_time_ip]}" 
		end

		if i[:admin_resolve_time].present? 
			comment.body += "Admin Resolve Time: #{i[:admin_resolve_time]}"
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
	User.create(name: "Cameron Craig", email: "cameron.craig@sproutdesigns.com", password: "degweb", password_confirmation: "degweb", isadmin: true)
	User.create(name: "Art", email: "admin@degweb.com", password: "degweb", password_confirmation: "degweb", isadmin: true)
	User.create(name: "Jorge", email: "orgecgarciais@gmail.com", password: "degweb", password_confirmation: "degweb", isadmin: true)
end


read_excel
setup_users


p "done"
# analyze_cell



