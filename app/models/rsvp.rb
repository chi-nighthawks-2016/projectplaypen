class Rsvp < ActiveRecord::Base
  belongs_to :child
  has_one :attendee, through: :child, source: :parent
  belongs_to :playdate 
end
