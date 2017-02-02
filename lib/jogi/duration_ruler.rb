require 'json'
require 'streamio-ffmpeg'
require 'mime/types'

module Jogi
  class DurationRuler
    class << self
      def measure(formatted = false)
        path = File.expand_path(ARGV.last, __FILE__)
        result = Dir.open(path){|dir|
          dir.select{|f| video_extensions_regexp =~ f}.map{|name| 
            movie_file_path = File.expand_path(name, path)
            duration = get_movie_duration(movie_file_path)
            {
              name: name,
              duration: formatted ? Time.at(duration).utc.strftime("%H:%M:%S") : duration
            }
          }
        }
        result
      end

      private
        def get_movie_duration(movie_file_path)
          movie = FFMPEG::Movie.new(movie_file_path)
          movie.duration
        end

        def video_extensions
          @video_extension ||= MIME::Types[/^video/].map(&:extensions).reduce(&:concat)
        end

        def video_extensions_regexp
          @video_extensions_regexp ||= /\.(#{video_extensions.join('|')})$/i
        end
    end
  end
end
