class AddValidation < ActiveRecord::Migration[6.0]
  def change
    add_index :categories, :title, unique: true
    add_index :tests, [:title, :level], unique: true
  end
end
