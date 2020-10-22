class BlogPost < ApplicationRecord
    validates :title, :statement, :presence => true
    validates :title, length: {minimum :3}
    validates :statement, length: {minimum :3}
end
