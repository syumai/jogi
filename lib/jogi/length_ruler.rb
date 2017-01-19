require 'json'

module Jogi
  class LengthRuler
    def measure
      path = File.expand_path(ARGV.last, __FILE__)
      result = Dir.open(path){|dir|
        dir.select{|f| /\.mp4$/i =~ f}.map{|name| 
          movie_file = File.expand_path(name, path)
          length = get_movie_length(movie_file)
          {
            name: name,
            length: length.slice(3..7)
          }
        }
      }
      result
    end
  end
end
