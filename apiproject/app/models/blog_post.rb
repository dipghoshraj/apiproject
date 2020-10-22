class BlogPost < ApplicationRecord
    validates :title, :blank_but_not_nil, presence: true, length: { minimum: 2 }
    validates :statement, :blank_but_not_nil, presence: true, length: { minimum: 2 }

    def blank_but_not_nil
        if self.foo.nil?
            errors.add :foo, 'cannot be nil'
        end
    end
end
