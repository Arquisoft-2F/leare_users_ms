class CoursesUser < ApplicationRecord
    self.primary_key = :course_id, :user_id
    belongs_to :user
    validates :course_id, presence: {message: "Course id not given" }
    validates :user_id, presence: {message: "User id not given" }
    validates :progress, presence: {message: "Progress not given" }
    validates :score, presence: {message: "Score not given" }
    validates :progress, :numericality => { :greater_than_or_equal_to => 0 ,message: "Progress must be numerical" }
    validates :score, :numericality => { :greater_than_or_equal_to => 0,    message: "Score must be numerical" }

    before_create :setDates
    def setDates
        self.last_seen = Date.current
        self.listed_on = Date.current
    end
end
