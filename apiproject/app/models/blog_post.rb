class BlogPost < ApplicationRecord
    validates :title, :blank_but_not_nil, presence: true, length: { minimum: 2 }, :allow_nil => false
    validates :statement, :blank_but_not_nil, presence: true, length: { minimum: 2 }, :allow_nil => false
end
