Card.destroy_all

card_no = 0

lines = File.readlines("db/question_answer_database_lines.txt")

until lines.empty?
    Card.create(card_number: card_no +1, card_type: "eneumerable", answer:lines.shift.chomp, question:lines.shift.chomp)
    card_no +=1
end
