class AddColumns < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :password_digest, :text, null: false
    add_column :users, :session_token, :text, null: false
  end
end
