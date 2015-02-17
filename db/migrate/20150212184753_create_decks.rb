class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.belongs_to :user, index:true
    	t.string :deck_name
    	t.integer :card_count

    t.timestamps
    end
  end
end
