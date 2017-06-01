require 'dotenv' 
require 'httparty'

load '.env'

@headers = { 
  "user-key" =>ENV["ZOMATO_KEY"]
}

get "/orders/search" do
	erb :'orders/search'

end 

get '/orders/location' do 

	@query= {"query"=>params[:city]}
	@headers = { 
	  "user-key" =>ENV["ZOMATO_KEY"]
	}
	@location= HTTParty.get("https://developers.zomato.com/api/v2.1/locations?query=",
	:query => @query,
	:headers => @headers 
	)
	@entity_id= @location["location_suggestions"][0]["entity_id"]

	@res_name = params[:restaurant]

	@res_search = HTTParty.get("https://developers.zomato.com/api/v2.1/search?entity_id="+@entity_id.to_s+"&q="+URI.escape(@res_name)+"&count=10&establishment_type=1" ,
		:headers => @headers
	)
	p "hahahahaha"


	 @res_name= @res_search["restaurants"][0]["restaurant"]["name"]

	 @res_address= @res_search["restaurants"][0]["restaurant"]["location"]["address"]


	

	



	# @menu = HTTParty.get("https://developers.zomato.com/api/v2.1/dailymenu?res_id=16753136",
	# :headers => @headers
	# )

	# p @menu

	erb :"orders/location"

end 

get '/orders' do 
	
	erb :'orders/index'
end



get "/orders/new" do 
	if session[:user_id]

		erb :'orders/new'
	else
		redirect '/sessions/new'
	end
end


get '/orders/:id' do
# @order= Order.find(params[:order_id])
erb :'/orders/show'

end 


get "/orders/:id/edit" do
@order =Order.find(params[:id])
	if session[:user_id] && session[:user_id]==@order.user_id 
erb :"/orders/edit"
		
	else
		redirect '/sessions/new'
	end


end 

post "/orders" do 
	
@order= Order.new(session[:user_id], "coffee_drink", "small" )
redirect '/orders'


end 

delete '/orders/:id' do 
	@photo = Photo.find(params[:id])
	if session[:user_id] && session[:user_id] == @photo.user_id
		@photo.destroy()
		redirect "/photos"
	else
		redirect "/sessions/new"

	end

end


