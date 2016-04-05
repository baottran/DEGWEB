class SearchesController < ApplicationController
	def create
		puts "*********************"
		@resolved_inquiries = Inquiry.all
		search_item = Search.create(search_params)
		puts search_params 
		search_result = search_item.search_inquiries
		puts search_item.description
		@inquiries = search_result
		@search = Search.new
		puts search_result
		puts "*********************"
		render "inquiries/index"
	end

	def index
		redirect_to inquiries_path
	end


	private

	def search_params
		params.require(:search).permit(:description)
	end


end
