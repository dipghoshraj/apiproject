class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true, length: { minimum: 6 }, :allow_nil => false, uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 6 }, :allow_nil => false
end
