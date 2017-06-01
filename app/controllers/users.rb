#sign up page
get '/users/new' do
	erb :"users/sign_up"
end
#create new user && new session 
post '/users' do
	@user = User.new(username: params[:username], first_name: params[:first_name], last_name: params[:last_name] )
	@user.password = params[:password]
	@user.save
	if @user 
		session[:user_id] =@user.id
		redirect "/orders/search"
	else
		@error= "Sign up failed. Please try again"
		erb :'users/sign_up'
	end
end

#Sessions
#login
get '/sessions/new' do 
	erb :"users/sign_in"

	
end
#authenticate user && set a new session
post '/sessions' do 
	@user = User.find_by(username: params[:username])
	
	if @user && User.authenticate(params[:username], params[:password])
		session[:user_id] =@user.id
		redirect "/orders/search"
	else
		@error = "Login failed, please try again"
		erb :"users/sign_in"
	end

end
#logout  && clear session 
delete '/sessions/:id' do 
	if session[:user_id] == params[:id].to_i
	session.clear 
	redirect '/sessions/new'
else
	redirect '/orders'
end


end