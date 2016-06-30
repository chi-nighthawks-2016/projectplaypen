get '/playdates/:id' do
  @playdate = Playdate.find(params[:id])
  erb :'playdates/_playdate_details', locals: {playdate: @playdate}, layout: false
end
