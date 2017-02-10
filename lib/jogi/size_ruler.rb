require 'fastimage'
require 'json'

module Jogi
  class SizeRuler
    class << self
      def measure(path)
        if File.directory?(path)
          Dir.open(path)
            .select{|f| /\.(jpg|png|bmp|gif)$/i =~ f}
            .map{|name| generate_hash(name, path)}
        else
          generate_hash(File.basename(path), File.dirname(path))
        end
      end

      private
        def generate_hash(name, path)
          image_file_path = File.expand_path(name, path)
          width, height = FastImage.size(image_file_path)
          {
            'name' => name,
            'width' => width,
            'height' => height
          }
        end
    end
  end
end
