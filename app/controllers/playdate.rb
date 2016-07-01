get '/playdates/new' do
 log_in unless current_user
 erb :'/playdates/new'
end

post '/playdates' do
  new_playdate = current_user.hostings.new(params[:entry])
  if new_playdate.save
    redirect "/playdates"
  else
    @error = new_playdate.errors.full_messages.join(". ")
    erb :'/playdates/new'
  end
end

get '/playdates/:id' do
  @playdate = Playdate.find(params[:id])
  erb :'playdates/_playdate_details', locals: {playdate: @playdate}, layout: false
end

put '/playdates/:id/edit' do
	edit_playdate = Playdate.find(params[:id])
	edit_playdate.assign_attributes(params[:entry])
	if edit_playdate.save
		redirect "/users/#{current_user.id}"
	else
		@error = dit_playdate.errors.full_messages.join(". ")
    erb :'users/profile'
	end
end


delete '/playdates/:id' do
  Playdate.find(params[:id]).destroy
  redirect "/users/#{current_user.id}"
end