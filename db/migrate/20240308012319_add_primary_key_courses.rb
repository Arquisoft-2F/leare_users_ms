class AddPrimaryKeyCourses < ActiveRecord::Migration[7.1]
  def up
    execute "ALTER TABLE courses_users ADD PRIMARY KEY (course_id, user_id);"
    execute "ALTER TABLE courses_users ADD CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE RESTRICT;"
  end
  def down
    execute "ALTER TABLE courses_users DROP PRIMARY KEY;"
    execute "ALTER TABLE courses_users DROP CONSTRAINT fk_user;"
  end
end
