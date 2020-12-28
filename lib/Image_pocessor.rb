require "mini_magick"

class ImageProcessor
    def self.resize_image(image_path)
        image = MiniMagick::Image.read(image_path.downloaded)
        image.resize "100x100"

        v_filename = image_path.filename
        v_contant = image_path.content_type

        return image.path, v_filename, v_contant
    end
end