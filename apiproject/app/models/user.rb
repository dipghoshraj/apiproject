class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true, length: { minimum: 6 }, email: true, uniqueness: true, allow_nil => false
end
