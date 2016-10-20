class User < ActiveRecord::Base
  # users.password_hash in the database is a :string
  include BCrypt


  validates_presence_of :username
  validates_uniqueness_of :username
  validates_presence_of :password
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :phone_number

  has_many :hosted_games, class_name: 'Game', foreign_key: 'host_id'
  has_and_belongs_to_many :games

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
