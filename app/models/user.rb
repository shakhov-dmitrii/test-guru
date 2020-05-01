class User < ApplicationRecord
  def tests_by_level(level)
    Test.joins('join results on tests.id = results.test_id')
      .where('results.user_id = ? and tests.level = ?', self.id, level)
  end
end
