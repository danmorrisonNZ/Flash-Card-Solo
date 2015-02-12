class User < ActiveRecord::Base
  has_and_belongs_to_many :cards
  has_and_belongs_to_many :decks

end
