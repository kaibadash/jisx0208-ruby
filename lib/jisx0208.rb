# frozen_string_literal: true

require_relative "JISX0208/version"
require_relative "JISX0208/processor"

module JISX0208
  class Code
    def initialize
      @processor = Processor.new
    end

    def contains_first_level_kanji?(string)
      @processor.contains_first_level_kanji?(string)
    end

    def contains_second_level_kanji?(string)
      @processor.contains_seconde_level_kanji?(string)
    end

    def contains_jisx0208_kanji?(string)
      @processor.contains_jisx0208_kanji?(string)
    end
  end
end
