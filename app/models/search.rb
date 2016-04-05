class Search < ActiveRecord::Base

	def search_inquiries

		inquiries = Inquiry.all 

		inquiries = inquiries.where(["search_criteria like ?", "%#{description.downcase}%"]) if description.present?

		puts "test"

		return inquiries

	end
end
