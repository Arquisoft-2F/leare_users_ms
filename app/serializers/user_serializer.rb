class UserSerializer < ActiveModel::Serializer
  attributes :id, :nickname, :name, :lastname, :picture_id, :nationality, :email, :web_site, :biography, :twitter_link, :linkedin_link, :facebook_link
  has_many :courses_users
end
