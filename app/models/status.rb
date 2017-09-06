class Status < ActiveRecord::Base
	def self.shared
		singleton = Status.all.last 

		if singleton != nil 
			return singleton
		else 
			new_item = Status.new
			new_item.save 
			return new_item
		end
	end

	def activate_text
		if self.shared.activated = true 
			return "on"
		else
			return "off"
		end
	end
end
