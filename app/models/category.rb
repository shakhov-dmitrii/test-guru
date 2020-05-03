class Category < ApplicationRecord
  has_many :tests

  validates :title, presence: true

  scope :sorted, -> { order(title: :asc) }
end
