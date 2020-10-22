class BlogPost < ApplicationRecord
    validates :title, presence: true, :allow_nil => false
    validates :statement, presence: true, :allow_nil => false
end
