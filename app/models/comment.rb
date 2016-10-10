class Comment < ActiveRecord::Base
  belongs_to :inquiry
  belongs_to :post 

  def view_type 
  	if self.internal_only === true 
  		return "Internal Only"
  	end
  	return "Public"
  end

end
