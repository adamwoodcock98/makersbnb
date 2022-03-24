class User < ActiveRecord::Base
  def self.authenticate(email:, password:)
    user = find_by(email: email)
    return nil if user.nil?
    return nil unless user.password == password
    return user.id
  end
end
