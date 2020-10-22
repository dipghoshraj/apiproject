class BlogPost < ApplicationRecord
    validates :title, presence: true, length: { minimum: 2 }, :allow_nil => false
    validates :statement, presence: true, length: { minimum: 2 }, :allow_nil => false
end
