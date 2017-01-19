require 'fastimage'
require 'json'

module Jogi
  class SizeRuler
    class << self
      def measure
        path = File.expand_path(ARGV.last, __FILE__)
        result = Dir.open(path){|dir|
          dir.select{|f| /\.(jpg|png|bmp|gif)$/i =~ f}.map{|name| 
            width, height = FastImage.size("#{path}/#{name}")
            {
              name: name,
              width: width,
              height: height
            }
          }
        }
        result
      end
    end
  end
end
