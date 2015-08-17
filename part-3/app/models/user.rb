require 'bcrypt'

class User < ActiveRecord::Base
	has_many :reviews
  has_many :created_restaurants, foreign_key: :creator_id #, source: :restaurants

	validates :email, uniqueness: true, presence: true, format: { with: /\A.+@.+\..+/,
    message: "needs @ sign followed by domain and suffix" }

	validate :valid_raw_password

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
  	@raw_password = new_password
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def valid_raw_password
  	unless @raw_password && @raw_password.length > 5 &&	@raw_password.match(/\d/) &&	@raw_password.match(/\W/)
  		errors.add(:password, "must be at least six digits and contain one number and one special character")
  	end
  end

end
