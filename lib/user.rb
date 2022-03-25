require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  def self.authenticate(email:, password:)
    user = find_by(email: email)
    return nil if user.nil?
    return nil unless user.password == password
    return user.id
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
