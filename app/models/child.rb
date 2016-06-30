class Child < ActiveRecord::Base
  belongs_to :parent, class_name: "User"
  has_many :rsvps

  validates :parent_id, presence: true
  validates :first_name, presence: true
  validates :birthday, presence: true
end
