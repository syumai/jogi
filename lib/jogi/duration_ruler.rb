require 'json'
require 'streamio-ffmpeg'
require_relative './extensions'

module Jogi
  class DurationRuler
    class << self
      def measure(formatted = false)
        path = File.expand_path(ARGV.last, __FILE__)
        Dir.open(path)
          .select{|f| Extensions.video_regexp =~ f}
          .map{|name| 
            movie_file_path = File.expand_path(name, path)
            duration = get_movie_duration(movie_file_path)
            {
              'name' => name,
              'duration' => formatted ? Time.at(duration).utc.strftime("%H:%M:%S") : duration
            }
          }
      end

      private
        def get_movie_duration(movie_file_path)
          movie = FFMPEG::Movie.new(movie_file_path)
          movie.duration
        end
    end
  end
end
