class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true, length: { minimum: 6 }, :allow_nil => false
end
