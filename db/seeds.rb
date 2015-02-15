Card.destroy_all

File.open("db/question_answer_database_lines.txt","r").each do |line|
  line = line.chomp.downcase
 
  card_no = 0
  Card.create(card_number: card_no +1, card_type: "eneumerable", question: , answer: )
  
end