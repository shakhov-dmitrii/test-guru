# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Create test user
user = User.create(name: "Tester", email: "qa@aa.aa", password: "1234")
user2 = User.create(name: "Tester 2", email: "qa@bb.bb", password: "1234")

#Create test categories
first_category = Category.create(title: "Ruby")
second_category = Category.create(title: "Golang")
third_category = Category.create(title: "JavaScript")

#Create test tests
first_test = Test.create(title: "Ruby and RoR", category_id: first_category.id, author_id: user.id, level: 0)
second_test = Test.create(title: "Golang and High-load", category_id: second_category.id, author_id: user2.id, level: 1)
third_test = Test.create(title: "React", category_id: third_category.id, author_id: user2.id, level: 2)
fourth_test = Test.create(title: "React Native", category_id: third_category.id, author_id: user.id, level: 3)
fifth_test = Test.create(title: "Active Record", category_id: first_category.id, author_id: user2.id, level: 4)

#Create test questions
first_question = Question.create(body: "First test question", test_id: fifth_test.id)
second_question = Question.create(body: "Second test question", test_id: third_test.id)
third_question = Question.create(body: "Third test question", test_id: first_test.id)
fourth_question = Question.create(body: "Fourth test question", test_id: third_test.id)
fifth_question = Question.create(body: "Fifth test question", test_id: fourth_test.id)

#Create tests answers
Answer.create(body: "My answer 1", correct: false, question_id: first_question.id)
Answer.create(body: "My answer 2", correct: true, question_id: first_question.id)
Answer.create(body: "My answer 3", correct: false, question_id: second_question.id)
Answer.create(body: "My answer 4", correct: true, question_id: second_question.id)
Answer.create(body: "My answer 5", correct: false, question_id: third_question.id)
Answer.create(body: "My answer 6", correct: true, question_id: third_question.id)
Answer.create(body: "My answer 7", correct: false, question_id: fourth_question.id)
Answer.create(body: "My answer 8", correct: true, question_id: fourth_question.id)
Answer.create(body: "My answer 9", correct: false, question_id: fifth_question.id)
Answer.create(body: "My answer 10", correct: true, question_id: fifth_question.id)
