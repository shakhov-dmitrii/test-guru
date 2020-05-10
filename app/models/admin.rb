class Admin < User
  validates :name, presence: true
  validates :login, presence: true
end
