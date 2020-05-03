class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_answers_in_question

  scope :correct_answers, -> { where(correct: true) }

  private
  def validate_answers_in_question
    errors.add(:question) if self.question.answers.count >= 4 
  end
end
