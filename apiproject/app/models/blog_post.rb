class BlogPost < ApplicationRecord
    validates :title, presence: true, length: {minimum :3}
    validates :statement, presence: true, length: {minimum :3}
end
