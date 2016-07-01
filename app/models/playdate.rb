class Playdate < ActiveRecord::Base
  belongs_to :host, class_name: :User
  has_many :rsvps
  has_many :children, through: :rsvps

  def attendees
    attendees = []
    self.rsvps.each do |rsvp|
      attendees << rsvp.child.parent
    end
    attendees
  end

  def year
    self.date.year
  end

  def month
    self.date.mon
  end

  def day
    self.date.day
  end

end
