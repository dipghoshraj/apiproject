class BlogPost < ApplicationRecord
    require "Image_pocessor"

    validates :title, presence: true, length: { minimum: 2 }, :allow_nil => false
    validates :statement, presence: true, length: { minimum: 2 }, :allow_nil => false
    has_one_attached :images
    has_one_attached :images_compressed
    validate :compress

    def as_json(opts={})
        basic_attributes = self.slice(:id, :title, :statement)
        basic_attributes.merge!({
            images: Rails.application.routes.url_helpers.rails_blob_path(self.images, only_path: true)
        }) if self.images.attached?

        basic_attributes.merge!({
            images_compressed: Rails.application.routes.url_helpers.rails_blob_path(self.images_compressed, only_path: true)
        }) if self.images.attached?
    end

    private
    def compress
        return unless images.attached?
        if images.blob.content_type.start_with? 'image/'
            if images.blob.byte_size > 10.megabytes
              errors.add(:images, 'size needs to be less than 10MB')
              images.purge
            else
              puts "****#{images}***"
              pict = ImageProcessor.resize_image(images) 
              _path = pict.first
              _filename = pict[1]
              _content_type = pict[2]
              images_compressed.attach(io: File.open(_path), filename:  _filename, content_type: _content_type)
            #   images
            end
        else
            profile_picture.purge
            errors.add(:profile_picture, 'needs to be an image')
        end
    end
end
