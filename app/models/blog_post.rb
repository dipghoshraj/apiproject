class BlogPost < ApplicationRecord
    validates :title, presence: true, length: { minimum: 2 }, :allow_nil => false
    validates :statement, presence: true, length: { minimum: 2 }, :allow_nil => false
    has_one_attached :images

    def as_json(opts={})
        basic_attributes = self.slice(:id, :title, :statement)
        basic_attributes.merge!({
            images: Rails.application.routes.url_helpers.rails_blob_path(self.images, only_path: true)
        })
    end
end
