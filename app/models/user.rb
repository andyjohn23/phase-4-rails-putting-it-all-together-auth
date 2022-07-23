class User < ApplicationRecord
    has_secure_password
    has_many :recipes
    validates_associated :recipes
    validates :username, presence: true, uniqueness: true
end
