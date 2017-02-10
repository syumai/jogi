require_relative 'jogi/size_ruler'
require_relative 'jogi/duration_ruler'

module Jogi
  class << self
    def size
      ::Jogi::SizeRuler.measure
    end

    def duration(path, **options)
      ::Jogi::DurationRuler.measure(path, **options)
    end
  end
end
