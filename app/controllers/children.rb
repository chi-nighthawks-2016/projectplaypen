get '/user/:id/children' do
  @children = Child.where(parent_id: params[:id])
  erb :'/children/show'
end
