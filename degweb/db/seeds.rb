# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name: "Bao Tran", email: "bowtran@gmail.com", password: "railstest", password_confirmation: "railstest")

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

20.times do 

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

		puts "finished adding"

				

		@inquiry.save 

		puts "finished saving"

	end 

