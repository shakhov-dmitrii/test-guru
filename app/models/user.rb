class User < ApplicationRecord
  VALID_EMAIL = /.+@.+../

  has_many :tests_author, class_name: 'Test', foreign_key: :author_id
  has_many :test_passages
  has_many :tests, through: :test_passages

  validates :email, presence: true, format: { with: VALID_EMAIL },
                    uniqueness: true

  has_secure_password

  def tests_by_level(level)
    self.tests.by_level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc ).find_by(test_id: test.id)
  end
end
