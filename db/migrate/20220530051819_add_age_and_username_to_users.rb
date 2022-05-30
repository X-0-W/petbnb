class AddAgeAndUsernameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :age, :integer
    add_column :users, :username, :string
  end
end
