class Test < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :category
  
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users

  validates :title, presence: true
  validates :author, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :level, uniqueness: { scope: :title, message: "should happen once per title" }

  scope :easy_tests, -> { where(level: 0..1) }
  scope :normal_tests, -> { where(level: 2..4) }
  scope :hard_tests, -> { where(level: 5..Float::INFINITY) }
  scope :by_level, -> (level) { where(level: level) }
  scope :by_category, -> (category) { joins(:category).where(categories: { title: category }).order(title: :desc) }

  def self.get_titles(category_name)
    by_category(category_name).pluck(:title)
  end
end
