class CreateCoursesUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :courses_users, id: false do |t|
      t.string :course_id
      t.float :progress
      t.float :score
      t.date :listed_on
      t.date :last_seen
      t.belongs_to :user,type: :string, null: false, foreign_key: true
      t.timestamps
    end
  end
end
