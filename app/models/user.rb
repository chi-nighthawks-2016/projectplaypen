class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :children, foreign_key: :parent_id

end
