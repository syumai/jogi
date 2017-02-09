require 'fastimage'
require 'json'

module Jogi
  class SizeRuler
    class << self
      def measure
        path = File.expand_path(ARGV.last, __FILE__)
        Dir.open(path)
          .select{|f| /\.(jpg|png|bmp|gif)$/i =~ f}
          .map{|name| 
            image_file_path = File.expand_path(name, path)
            width, height = FastImage.size(image_file_path)
            {
              'name' => name,
              'width' => width,
              'height' => height
            }
          }
      end
    end
  end
end
