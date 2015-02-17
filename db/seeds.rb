Card.destroy_all

card_no = 0

lines = File.readlines("db/question_answer_database_lines.txt")
total_lines = lines.length/2
until lines.empty?
    Card.create(deck_id: 1 ,card_number: card_no +1, card_type: "eneumerable", answer:lines.shift.chomp, question:lines.shift.chomp)
    card_no +=1
end

Deck.create(id:1 , user_id: 1, deck_name: "eneumerable", card_count: total_lines)
User.create(id:1, user_name:"danmorrisonNZ", first_name: "Dan", last_name:"Morrison", email: "danielroy.morrison@gmail.com", password:"1111")
