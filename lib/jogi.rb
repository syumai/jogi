require_relative 'jogi/size_ruler'
require_relative 'jogi/length_ruler'

module Jogi
  class << self
    def size
      ::Jogi::SizeRuler.measure
    end

    def length
      ::Jogi::LengthRuler.measure
    end
  end
end
