require 'dotenv'
require 'zomato'

load '.env'

class Order < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  has_many :items 

  def initialize(user_id, item_name, item_size) 
	@user_id= user_id
	@item_name= item_name
	@item_size=item_size

end


end

@auth = {
	api_key: ENV["ZOMATO_KEY"]
}

