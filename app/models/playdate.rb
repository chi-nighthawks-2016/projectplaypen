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

  def self.this_months_playdates
    self.all.where('extract(month from date) = ?', Date.today.mon)
  end

end
