get '/user/:id/children' do
  log_in unless current_user
  @children = Child.where(parent_id: params[:id])
  erb :'/children/show'
end

get '/user/:id/children/new' do
  @user = User.find(params[:id])
  restricted_access unless user_authorization(@user)
  erb :'/children/new'
end

post '/user/:id/children' do
  @user = User.find(params[:id])
  restricted_access unless user_authorization(@user)
  new_child = @user.children.new(params[:entry])
  if new_child.save
    redirect "/user/#{@user.id}/children"
  else
    @error = new_child.errors.full_messages.join(". ")
    erb :'/children/new'
  end
end

get '/user/:id/children/:child_id/edit' do
  @child = Child.find(params[:child_id])
  restricted_access unless user_authorization(@child.parent)
  erb :'/children/edit'
end

put '/user/:id/children/:child_id' do
  @child = Child.find(params[:child_id])
  restricted_access unless user_authorization(@child.parent)
  @child.assign_attributes(params[:entry])
  if @child.save
    redirect "/user/#{@child.parent.id}/children"
  else
    @error = edit_child.errors.full_messages.join(". ")
    erb :'/children/edit'
  end
end

delete '/user/:id/children/:child_id' do
  @child = Child.find(params[:child_id])
  restricted_access unless user_authorization(@child.parent)
  if @child
    @child.destroy
  end
  redirect "/user/#{@child.parent.id}/children"
end
