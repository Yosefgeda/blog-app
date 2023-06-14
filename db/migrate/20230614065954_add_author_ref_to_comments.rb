class AddAuthorRefToComments < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :comments, :users, column: :author_id
    add_index :comments, :author_id
  end
end
