get '/login' do
  erb :'users/login'
end

post '/login' do
  @user = User.find_by(username: params[:username])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect ("/users/#{@user.id}/show")
  else
    @errors = "Invalid Username or Password"
    erb :'users/login'
  end
end

get '/register' do
  erb :'/users/user_new'
end

get '/users/:id/show' do
  @user = User.find(params[:id])
  erb :'/users/show'
end

put '/users/:id' do

end

get '/users/:id/edit' do
  @user = User.find(params[:id])
  erb :'/users/new'

end

post '/users' do
  @user = User.new(username: params[:username], email: params[:email], password: params[:password], first_name: params[:first_name], last_name: params[:last_name], phone: params[:phone] )
  if @user.save
    session[:user_id] = @user.id
    @message = "You have been successfuly registered!"
    erb :"/users/#{@user.id}/playdates"
  else
    @errors = @user.errors
    erb :'users/user_new'
  end
end

delete '/logout' do
  session.destroy
  @message = "You have been successfully logged out"
  erb :'/users/login'
end
