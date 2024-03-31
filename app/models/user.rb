class User < ApplicationRecord
    has_many :courses_users, dependent: :destroy
    validates :nickname, presence:  {message: "Nickname not given" }
    validates :name, presence:  {message: "Name not given" }
    validates :email, presence:  {message: "Email not given" }
    validates :nationality, presence:  {message: "Nationality not given" }
    validates :nickname, uniqueness: {message: "Nickname alredy used" }
    validates :id, uniqueness: {message: "Id alredy used" }
    validates :email, uniqueness: {message: "Email alredy used" }
    validates :nickname,length: { minimum: 3 , message: "Nickname too short (Minimum 3 letters)" }
    validates :name ,length: { minimum: 3 ,message: "Name too short (Minimum 3 letters)" }
    validates :email, format: { with: /\A[^@]+@[^@]+\.[a-zA-Z]{2,}\z/, message: "Enter a valid email" },length: { minimum: 10, message: "Enter a valid email" }
    before_create :set_uuid

    def set_uuid
        self.id = SecureRandom.uuid
    end
end
