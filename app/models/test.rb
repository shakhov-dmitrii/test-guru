class Test < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :category
  
  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :level, uniqueness: { scope: :title, message: "should happen once per title" }

  scope :easy_tests, -> { where(level: 0..1) }
  scope :normal_tests, -> { where(level: 2..4) }
  scope :hard_tests, -> { where(level: 5..Float::INFINITY) }
  scope :by_level, -> (level) { where(level: level) }
  scope :by_category, -> (category) { joins(:category).where(categories: { title: category }) }

  def self.get_titles(category_name)
    by_category(category_name).order(title: :desc).pluck(:title)
  end
end
