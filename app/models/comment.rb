class Comment < ActiveRecord::Base
  belongs_to :inquiry
  belongs_to :post 
end
