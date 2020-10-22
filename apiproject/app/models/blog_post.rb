class BlogPost < ApplicationRecord
    validates :title, presence: true, length: { minimum: 2 }
    validates :statement, presence: true, length: { minimum: 2 }
end
