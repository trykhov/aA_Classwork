# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Response.destroy_all
AnswerChoice.destroy_all
Question.destroy_all
Poll.destroy_all
User.destroy_all

u1 = User.create(username: 'man_man')
u2 = User.create(username: 'johny bravo')
u3 = User.create(username: 'mlk')

poll_master = User.create(username: 'poll_master')

poll = Poll.create(author_id: poll_master.id, title: "What is life?")

q1 = Question.create(poll_id: poll.id, text: "Do you like cheese?")
q2 = Question.create(poll_id: poll.id, text: "Laurel or Yanny?")
q3 = Question.create(poll_id: poll.id, text: "Is it data or data?")

r1_q1 = AnswerChoice.create(question_id: q1.id, user_id: u1.id, text: "Hell yeah")
r2_q1 = AnswerChoice.create(question_id: q1.id, user_id: u2.id, text: "Nah")

r3_q2 = AnswerChoice.create(question_id: q3.id, user_id: u3.id, text: "data")

r1_q1_response = Response.create(question_id: q1.id, answer_choice_id: r1_q1.id, user_id: u1.id)
r2_q1_response = Response.create(question_id: q1.id, answer_choice_id: r2_q1.id, user_id: u2.id)
r3_q2_response = Response.create(question_id: q3.id, answer_choice_id: r3_q2.id, user_id: u3.id)
