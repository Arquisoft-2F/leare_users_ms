class AddNullContraintsTables < ActiveRecord::Migration[7.1]
  def up
    change_column_null :users, :nickname, false
    change_column_null :users, :name, false
    change_column_null :users, :lastname, false
    change_column_null :users, :email, false
    change_column_null :courses_users, :progress, false
    change_column_null :courses_users, :score, false
    change_column_null :courses_users, :listed_on, false
    change_column_null :courses_users, :last_seen, false
  end
  def down 
    change_column_null :users, :nickname, true
    change_column_null :users, :name, true
    change_column_null :users, :lastname, true
    change_column_null :users, :email, true
    change_column_null :courses_users, :progress, true
    change_column_null :courses_users, :score, true
    change_column_null :courses_users, :listed_on, true
    change_column_null :courses_users, :last_seen, true
  end
end
