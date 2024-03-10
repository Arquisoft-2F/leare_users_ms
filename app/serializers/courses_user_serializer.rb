class CoursesUserSerializer < ActiveModel::Serializer
  attributes :course_id, :user_id, :progress, :score, :listed_on, :last_seen
end
