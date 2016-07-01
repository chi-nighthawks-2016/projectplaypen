class User < ActiveRecord::Base
  has_many :children, foreign_key: :parent_id
  has_many :rsvps, through: :children
  has_many :playdates, through: :rsvps, source: :playdate
  has_many :hostings, class_name: "Playdate", foreign_key: :host_id

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :pw_hash, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true

  def password
    @password ||= BCrypt::Password.new(pw_hash)
  end

  def password=(new_password)
    if !new_password.empty?
      @password = BCrypt::Password.create(new_password)
      self.pw_hash = @password
    end
  end

  def authenticate(pw_hash)
    self.password == pw_hash
  end

  def future_playdates
    self.playdates.where("date >= ?", Date.today)[0..4]
  end

  def past_playdates
    self.playdates.where("date < ?", Date.today)[0..4]
  end

  def users_months_playdates
    self.playdates.where('extract(month from date) = ?', Date.today.mon)
  end

end
