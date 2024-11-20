# frozen_string_literal: true

require "spec_helper"

RSpec.describe JISX0208::Code do
  let(:code) { JISX0208::Code.new }
  let(:first_level_kanji_chars) { %w(亜 腕 駐 車 場 回 転 寿 司) }
  let(:second_level_kanji_chars) { %w(偃 龠 假 會 偕 偐 偈 做 偖 澤) }
  it "contains first level kanji" do
    first_level_kanji_chars.each do |char|
      expect(code.contains_first_level_kanji?(char)).to eq(true)
    end

    second_level_kanji_chars.each do |char|
      expect(code.contains_first_level_kanji?(char)).to eq(false)
    end
  end

  it "contains second level kanji" do
    first_level_kanji_chars.each do |char|
      expect(code.contains_second_level_kanji?(char)).to eq(false)
    end

    second_level_kanji_chars.each do |char|
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

  it "only contains first level kanji" do
    expect(code.only_first_level_kanji?(first_level_kanji_chars.join)).to eq(true)
    expect(
      code.only_first_level_kanji?(first_level_kanji_chars.join + second_level_kanji_chars.first),
    ).to eq(false)
  end

  it "only contains second level kanji" do
    expect(code.only_second_level_kanji?(second_level_kanji_chars.join)).to eq(true)
    expect(
      code.only_second_level_kanji?(second_level_kanji_chars.join + first_level_kanji_chars.first),
    ).to eq(false)
  end

  it "only contains jisx0208 kanji" do
    expect(code.only_jisx0208_kanji?(first_level_kanji_chars.join)).to eq(true)
    expect(code.only_jisx0208_kanji?(second_level_kanji_chars.join)).to eq(true)
    expect(
      code.only_jisx0208_kanji?(first_level_kanji_chars.join + second_level_kanji_chars.join),
    ).to eq(true)
    expect(
      code.only_jisx0208_kanji?("X#{first_level_kanji_chars.join}#{second_level_kanji_chars.join}"),
    ).to eq(false)
  end

  it "only contains jisx0208" do
    expect(code.only_jisx0208?("楽しい呪術廻戦。２作目マダ？ｗ")).to eq(true)
    expect(code.only_jisx0208?("楽しい呪術廻戦。2作目マダ？w")).to eq(false)
  end

  it "contains jisx0208" do
    expect(code.contains_jisx0208?("楽しい呪術廻戦。2作目マダ？ 100億部!w")).to eq(true)
    expect(code.contains_jisx0208?("Good! score 100!")).to eq(false)
  end
end
