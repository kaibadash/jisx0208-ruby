# frozen_string_literal: true

require_relative "jisx0208/version"
require_relative "jisx0208/processor"

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

    def only_first_level_kanji?(string)
      @processor.only_first_level_kanji?(string)
    end

    def only_second_level_kanji?(string)
      @processor.only_second_level_kanji?(string)
    end

    def only_jisx0208_kanji?(string)
      @processor.only_jisx0208_kanji?(string)
    end

    def contains_jisx0208?(string)
      @processor.contains_jisx0208?(string)
    end

    def only_jisx0208?(string)
      @processor.only_jisx0208?(string)
    end

    def only_common_japanese_characters?(string)
      @processor.only_common_japanese_characters?(string)
    end
  end
end
