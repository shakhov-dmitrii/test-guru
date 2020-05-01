class AddDependenciesBetweenQuestionsAndTests < ActiveRecord::Migration[6.0]
  def change
    add_reference(:questions, :tests, foreign_key: true)
  end
end
