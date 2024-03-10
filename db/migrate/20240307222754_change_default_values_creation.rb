class ChangeDefaultValuesCreation < ActiveRecord::Migration[7.1]
  def up
    change_column_default :courses_users, :progress, 0.0
    change_column_default :courses_users, :score, 0.0
  end
  def dowm
    change_column_default :courses_users, :progress, nil
    change_column_default :courses_users, :score, nil
  end
end
