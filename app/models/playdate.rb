class Playdate < ActiveRecord::Base
  belongs_to :host, class_name: :User
  has_many :rsvps

  def attendees
    attendees = []
    self.rsvps.each do |rsvp|
      attendees << rsvp.child.parent
    end
    attendees
  end
  
end
