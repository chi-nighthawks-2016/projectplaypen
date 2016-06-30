class Playdate < ActiveRecord::Base
  belongs_to :host, class_name: :User
  has_many :rsvps
end
