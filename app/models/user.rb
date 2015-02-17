class User < ActiveRecord::Base
  has_many :decks

  def self.authenticate(username, password)
    User.find_by(user_name: username, password: password)
  end

end
