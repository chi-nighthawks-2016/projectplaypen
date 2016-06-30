get '/login' do
  erb :'users/login'
end

post '/login' do
  @user = User.find_by(username: params[:username])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect ("/users/#{@user.id}")
  else
    @errors = "Invalid Username or Password"
    erb :'users/login'
  end
end

get '/register' do
  erb :'/users/new'
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/profile', locals: {user: @user}
end


put '/users/:id' do
  @user = User.find(params[:id])
  @user.update_attributes(username: params[:username], email: params[:email], password: params[:password], first_name: params[:first_name], last_name: params[:last_name], phone: params[:phone])
  @message = "Your profile has been saved!"
  erb :'/users/profile', locals: {user: @user}
end

get '/users/:id/edit' do
  @user = User.find(params[:id])
  erb :'/users/new'

end

post '/users' do
  @user = User.new(username: params[:username], email: params[:email], password: params[:password], first_name: params[:first_name], last_name: params[:last_name], phone: params[:phone] )
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors
    erb :'users/new'
  end
end

delete '/logout' do
  session.destroy
  @message = "You have been successfully logged out"
  erb :'/users/login'
end
