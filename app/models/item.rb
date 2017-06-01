
class Item < ActiveRecord::Base
  # Remember to create a migration!
belongs_to :order 

end
