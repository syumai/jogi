require 'mime/types'

module Jogi
  class Extensions
    class << self
      def video
        @video ||= MIME::Types[/^video/].map(&:extensions).reduce(&:concat)
      end

      def video_regexp
        @video_regexp ||= /\.(#{video.join('|')})$/i
      end
    end
  end
end
