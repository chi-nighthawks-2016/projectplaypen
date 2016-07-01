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

get '/playdates' do
    content_type :json
    @current_profile = User.find(params[:profile])
    playdates = @current_profile.this_months_playdates
    events = []
    playdates.each do |playdate|
      events << { :title => playdate.title, :start => playdate.date }
    end
    events.to_json
end
