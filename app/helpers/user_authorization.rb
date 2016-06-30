module UserAuthorization
  def restricted_access
    halt(404, erb(:'404'))
  end

  def user_authorization(original_poster)
    current_user == original_poster
  end
end

helpers UserAuthorization
