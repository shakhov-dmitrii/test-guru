class AddDefaultValueForTestsLevelAndAnswersCorrect < ActiveRecord::Migration[6.0]
  def change
    change_column(:tests, :level, :integer, default: 0)
    change_column(:answers, :correct, :boolean, default: false)
  end
end
