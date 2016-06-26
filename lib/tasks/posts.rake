  require 'csv'
	require 'roo'

namespace :posts do 

  task :init => :environment do
  	spreadsheet = Roo::Excelx.new("./lib/assets/DEGBlogPostings2.xlsx")
  	p "read the spreadsheet"
  	header = spreadsheet.row(1)
  	spreadsheet.each(	date: 'Date',
  										title: 'Title',
  										posting: 'Posting') do |i|
  		newpost = Post.new 
  		newpost.created_at = i[:date]
  		newpost.title = i[:title]
  		newpost.text = i[:posting]
  		newpost.save 
  		p "saved #{i[:title]}"
  	end
  end

end