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
  erb :'playdates/_playdate_details', locals: {playdate: @playdate}
end

get '/playdates' do
	@playdates = Playdate.all
	erb :'/playdates/playdates'
end

post '/playdates/:id/rsvp' do
	@playdate = Playdate.find(params[:id])
	@rsvp = Rsvp.new(child_id: params[:child_id], playdate_id: params[:id])
	if @rsvp.save
		erb :'/playdates/_playdate_details', locals: {playdate: @playdate}
	else
		@error = @rsvp.errors.full_messages
		erb :'/playdates/_playdate_details'
	end
end

delete '/playdates/:id/rsvp' do
	@playdate = Playdate.find(params[:id])
	@rsvp = Rsvp.find_by(child_id: params[:child_id], playdate_id: params[:id]).destroy
	erb:'/playdates/_playdate_details', locals: {playdate: @playdate}
end
