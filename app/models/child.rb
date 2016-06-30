class Child < ActiveRecord::Base
  belongs_to :parent, class_name: "User"
  has_many :rsvps

  validates :parent_id, presence: true
  validates :first_name, presence: true
  validates :birthday, presence: true

  def age
    difference = Time.now - birthday
    year = (difference/(24 * 60 * 60 * 7 * 52)).floor
    if year < 1
      "#{(difference/(24 * 60 * 60 * 7 * 52)*12).floor} months"
    else
      year
    end
  end
end
