class Card < ActiveRecord::Base
  belongs_to :decks

  

  def answer?(answer)
      if answer == Card.answer
      puts "correct!"
      else
      puts "incorrect!"
      end
  end

end
