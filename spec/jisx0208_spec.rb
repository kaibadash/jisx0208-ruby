# frozen_string_literal: true

require "spec_helper"

RSpec.describe JISX0208::Code do
  let(:code) { JISX0208::Code.new }

  it "contains first level kanji" do
    %w[亜 腕 駐 車 場 回 転 寿 司].each do |char|
      expect(code.contains_first_level_kanji?(char)).to eq(true)
    end

    %w[偃 龠 假 會 偕 偐 偈 做 偖].each do |char|
      expect(code.contains_first_level_kanji?(char)).to eq(false)
    end
  end

  it "contains second level kanji" do
    %w[亜 腕 駐 車 場 回 転 寿 司].each do |char|
      expect(code.contains_second_level_kanji?(char)).to eq(false)
    end

    %w[偃 龠 假 會 偕 偐 偈 做 偖].each do |char|
      expect(code.contains_second_level_kanji?(char)).to eq(true)
    end
  end

  it "contains jisx0208 kanji" do
    expect(code.contains_jisx0208_kanji?("亜")).to eq(true)
    expect(code.contains_jisx0208_kanji?("弌")).to eq(true)
    expect(code.contains_jisx0208_kanji?("亜X")).to eq(true)
    expect(code.contains_jisx0208_kanji?("弌X")).to eq(true)
    expect(code.contains_jisx0208_kanji?("JIS")).to eq(false)
  end
end
