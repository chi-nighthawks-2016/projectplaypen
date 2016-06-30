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
