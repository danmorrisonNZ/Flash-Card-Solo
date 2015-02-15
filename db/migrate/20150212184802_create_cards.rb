class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
    	t.integer :card_number
    	t.string :card_type
    	t.string :question
    	t.string :answer

    t.timestamps
    end
  end
end
