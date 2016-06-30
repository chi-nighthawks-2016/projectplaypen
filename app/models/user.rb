class User < ActiveRecord::Base
  has_many :children, foreign_key: :parent_id
  has_many :rsvps, through: :children
  has_many :playdates, through: :rsvps, source: :playdate
  has_many :hostings, class_name: :Playdate, foreign_key: :host_id

  validates :username, presence: { message: "cannot be empty" },
                      uniqueness: true
  validates :email, presence:  { message: "cannot be empty" },
                      uniqueness: true
  validates :pw_hash, presence: { message: "cannot be empty" }

  def password
    @password ||= BCrypt::Password.new(pw_hash)
  end

  def password=(new_password)
    if !new_password.empty?
      @password = BCrypt::Password.create(new_password)
      self.pw_hash = @password
    end
  end

  def authenticate(typed_password)
    self.password == typed_password
  end

  def future_playdates
    self.playdates.where("date >= ?", Date.today)[0..4]
  end

  def past_playdates
    self.playdates.where("date < ?", Date.today)[0..4]
  end

end
