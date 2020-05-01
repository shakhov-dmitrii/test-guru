# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Create test user
user = User.create(name: "Tester", login: "qa", password: "1234")

#Create test categories
first_category = Category.create(title: "Ruby")
second_category = Category.create(title: "Golang")
third_category = Category.create(title: "JavaScript")

#Create test tests
first_test = Test.create(title: "Ruby and RoR", categories_id: first_category.id)
second_test = Test.create(title: "Golang and High-load", categories_id: second_category.id)
third_test = Test.create(title: "React", categories_id: third_category.id)
fourth_test = Test.create(title: "React Native", categories_id: third_category.id)
fifth_test = Test.create(title: "Active Record", categories_id: first_category.id)

#Create test resulr
Result.create(user_id: user.id, test_id: second_test.id)

#Create test questions
first_question = Question.create(body: "First test question", tests_id: fifth_test.id)
second_question = Question.create(body: "Second test question", tests_id: third_test.id)
third_question = Question.create(body: "Third test question", tests_id: first_test.id)
fourth_question = Question.create(body: "Fourth test question", tests_id: third_test.id)
fifth_question = Question.create(body: "Fifth test question", tests_id: fourth_test.id)

#Create tests answers
Answer.create(body: "My answer 1", correct: false, questions_id: first_question.id)
Answer.create(body: "My answer 2", correct: true, questions_id: first_question.id)
Answer.create(body: "My answer 3", correct: false, questions_id: second_question.id)
Answer.create(body: "My answer 4", correct: true, questions_id: second_question.id)
Answer.create(body: "My answer 5", correct: false, questions_id: third_question.id)
Answer.create(body: "My answer 6", correct: true, questions_id: third_question.id)
Answer.create(body: "My answer 7", correct: false, questions_id: fourth_question.id)
Answer.create(body: "My answer 8", correct: true, questions_id: fourth_question.id)
Answer.create(body: "My answer 9", correct: false, questions_id: fifth_question.id)
Answer.create(body: "My answer 10", correct: true, questions_id: fifth_question.id)
