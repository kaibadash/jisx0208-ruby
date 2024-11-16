# frozen_string_literal: true

module JISX0208
  class Processor
    def initialize
      # https://www.unicode.org/Public/MAPPINGS/OBSOLETE/EASTASIA/JIS/JIS0208.TXT
      file_path = File.join(File.dirname(__FILE__), "..", "..", "data", "JIS0208.TXT")
      file = File.open(file_path)

      mappings = file.each_line.with_object([]) do |line, arr|
        next if line.start_with?("#")

        _sjis, _, unicode, _others = line.split(" ")
        arr << { jisx: unicode.to_i(16) }
      end

      # see http://ash.jp/code/unitbl21.htm
      @first_level_ranges = collect_unicode_set(mappings, 0x3021, 0x4F53)
      @second_level_ranges = collect_unicode_set(mappings, 0x5021, 0x7426)
    end

    def contains_first_level_kanji?(string)
      string.each_char.any? { |char| @first_level_ranges.include?(char.ord) }
    end

    def contains_seconde_level_kanji?(string)
      string.each_char.any? { |char| @second_level_ranges.include?(char.ord) }
    end

    def contains_jisx0208_kanji?(string)
      contains_first_level_kanji?(string) || contains_seconde_level_kanji?(string)
    end

    private

    def collect_unicode_set(mappings, jisx_start, jisx_end)
      mappings.map do |unicode_value|
        unicode_value[:jisx] if unicode_value[:jisx].between?(jisx_start, jisx_end)
      end.compact.to_set
    end
  end
end
