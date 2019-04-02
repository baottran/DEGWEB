module ApplicationHelper
	def sortable(column, title = nil, status = nil)
		title ||= column.titleize
		css_class = column == sort_column ? "current #{sort_direction}" : nil
		direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
		# link_to title, {:sort => column, :direction => direction}, :class => 'current'
		# link_to title, {sort: column, direction: direction}, class: css_class

		# link_to title, params.merge(:sort => column, :direction => direction, :status => status, :page => nil), class: css_class
		# received the following error: ArgumentError in Inquiries#index
		# Showing /Users/chinguyen/Desktop/DEGWEB/app/views/inquiries/index.html.erb where line #174 raised:
		#
		# Attempting to generate a URL from non-sanitized request parameters! An attacker can inject malicious data into the generated URL, such as changing the host. Whitelist and sanitize passed parameters to be secure.
		link_to title, params.permit(:direction, :page).merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
	end
end
