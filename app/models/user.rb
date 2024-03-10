class User < ApplicationRecord
    has_many :courses_users, dependent: :destroy
    validates :nickname, :name, :email,:nationality, presence: true
    validates :nickname, :id, :email, uniqueness: true
    validates :nickname, :name ,length: { minimum: 3 }
    validates :email, format: { with: /\A[^@]+@[^@]+\.[a-zA-Z]{2,}\z/},length: { minimum: 10 }
    before_create :set_uuid

    def set_uuid
        self.id = SecureRandom.uuid
    end
end
