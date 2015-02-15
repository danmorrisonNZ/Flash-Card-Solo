class CreateUserCardDecks < ActiveRecord::Migration
  def change
	create_table :carddecks, id: false do |t|
	  t.belongs_to :Deck, index: true
	  t.belongs_to :Card, index: true
	  t.belongs_to :user, index: true
	end
  end
end
