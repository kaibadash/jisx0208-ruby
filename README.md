# Jisx0208

JIS X 0208 is a collection of common characters used in Japanese writing, place names, and people's names.
[jisx0208](https://rubygems.org/gems/jisx0208) is a Ruby gem that provides a simple way to check if a string contains [JIS X 0208 characters](https://www.unicode.org/Public/MAPPINGS/OBSOLETE/EASTASIA/JIS/JIS0208.TXT).

## Installation

```ruby
gem install jisx0208
```

## Usage

```ruby
require "jisx0208"

code = JISX0208::Code.new
code.contains_first_level_kanji?("亜") # => true
code.contains_first_level_kanji?("弌") # => false
code.contains_seconde_level_kanji?("弌") # => true
code.contains_seconde_level_kanji?("亜") # => false
# same as (contains_first_level_kanji || contains_seconde_level_kanji)
code.contains_jisx0208_kanji?("亜弌") # => true

code.only_first_level_kanji?("回転寿司") # => true
code.only_second_level_kanji?("偃龠偕") # => true
# same as (only_first_level_kanji || only_second_level_kanji)
code.only_jisx0208_kanji?("回転寿司偃龠偕") # => true
```
