require 'json'
require 'streamio-ffmpeg'
require_relative './extensions'

module Jogi
  class DurationRuler
    class << self
      def measure(path, **options)
        if File.directory?(path)
          Dir.open(path)
            .select{|f| Extensions.video_regexp =~ f}
            .map{|name| generate_hash(name, path, options[:formatted])}
        else
          generate_hash(File.basename(path), File.dirname(path), options[:formatted])
        end
      end

      private
        def generate_hash(name, path, formatted)
            movie_file_path = File.expand_path(name, path)
            duration = get_movie_duration(movie_file_path)
            {
              'name' => name,
              'duration' => formatted ? Time.at(duration).utc.strftime("%H:%M:%S") : duration
            }
        end

        def get_movie_duration(movie_file_path)
          movie = FFMPEG::Movie.new(movie_file_path)
          movie.duration
        end
    end
  end
end
