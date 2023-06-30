class IndexEmailColumn < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :email, :string, unique: true
    add_index :users, :email
  end
end
