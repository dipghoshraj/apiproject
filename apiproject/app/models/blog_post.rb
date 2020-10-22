class BlogPost < ApplicationRecord
    validates :title, :statement, :presence => true
end
