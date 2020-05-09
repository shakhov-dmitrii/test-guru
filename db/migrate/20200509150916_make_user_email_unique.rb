class MakeUserEmailUnique < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :email, :string, unique: true
    change_column_null :users, :email, false
  end
end
