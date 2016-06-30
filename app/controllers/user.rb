get '/login' do
  erb :'/user/login'
end

post '/login' do
  @user = User.find_by(username: params[:username])
  if @user && @user.authenticate
    erb :"/user/#{@user.id}/playdates"
  else
    @errors = @user.errors
    erb :login
  end
end

get '/register' do
  erb :'/user/user_new'
end

post '/user' do
  @user = User.new(username: params[:username], email: params[:email], password: params[:password], first_name: params[:first_name], last_name: params[:last_name], phone: params[:phone] )
  p @user
  if @user.save
    @message = "You have been successfuly registered!"
    erb :"/user/#{@user.id}/playdates"
  else
    @errors = @user.errors
    erb :'user/user_new'
  end
end
