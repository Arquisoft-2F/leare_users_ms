class CoursesUser < ApplicationRecord
    self.primary_key = :course_id, :user_id
    belongs_to :user
    validates :course_id, :user_id, :progress, :score, presence: true
    validates :progress, :score, :numericality => { :greater_than_or_equal_to => 0 }

    before_create :setDates
    def setDates
        self.last_seen = Date.current
        self.listed_on = Date.current
    end
end
