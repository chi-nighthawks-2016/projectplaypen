module DateHelpers
  def format(date_object)
    date_object.strftime("%Y-%m-%d")
  end
end

helpers DateHelpers
