class AddAgeAndFavoriteToUsers < ActiveRecord::Migration
  def change
    add_column :users, :age, :integer
    add_column :users, :favorite, :string
  end
end
