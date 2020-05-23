class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', foreign_key: 'current_question_id', optional: true

  before_validation :before_validation_set_first_question, on: :create
  after_validation :after_validation_set_next_question, on: :update

  TEST_SUCCESS_RATE = 85

  def accept!(answer_ids)
    return if answer_ids.nil?

    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def completed?
    current_question.nil?
  end

  def percent
    (self.correct_questions * 100) / questions_count
  end

  def success?
    percent > TEST_SUCCESS_RATE
  end

  def current_question_number
    questions_count - remaining_questions.count
  end

  def questions_count
    test.questions.count
  end

  def progress
    ((current_question_number - 1) * 100) / questions_count
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def after_validation_set_next_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.corrects
  end

  def remaining_questions
    test.questions.order(:id).where('id > ?', current_question.id) 
  end

  def next_question
    remaining_questions.first
  end
end
