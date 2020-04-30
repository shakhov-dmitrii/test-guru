class AddDependenciesBetweenAnswersAndQuestions < ActiveRecord::Migration[6.0]
  def change
    add_reference(:answers, :questions, foreign_key: true)
  end
end
