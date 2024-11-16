# frozen_string_literal: true

require "spec_helper"

RSpec.describe JISX0208::Code do
  let(:code) { JISX0208::Code.new }

  it "contains first level kanji" do
    expect(code.contains_first_level_kanji?("亜")).to eq(true)
    expect(code.contains_first_level_kanji?("弌")).to eq(false)
    expect(code.contains_first_level_kanji?("亜X")).to eq(true)
    expect(code.contains_first_level_kanji?("弌X")).to eq(false)
  end

  it "contains second level kanji" do
    expect(code.contains_second_level_kanji?("亜")).to eq(false)
    expect(code.contains_second_level_kanji?("弌")).to eq(true)
    expect(code.contains_second_level_kanji?("亜X")).to eq(false)
    expect(code.contains_second_level_kanji?("弌X")).to eq(true)
  end

  it "contains jisx0208 kanji" do
    expect(code.contains_jisx0208_kanji?("亜")).to eq(true)
    expect(code.contains_jisx0208_kanji?("弌")).to eq(true)
    expect(code.contains_jisx0208_kanji?("亜X")).to eq(true)
    expect(code.contains_jisx0208_kanji?("弌X")).to eq(true)
  end
end
